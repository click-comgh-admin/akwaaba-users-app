import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/tab_contents/datatable/colums/right.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/datatable/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MeetingsDataTableSource
    extends AdvancedDataTableSource<AttendanceScheduleModel> {
  List<int> selectedIds = [];
  String lastSearchTerm = '';
  dynamic _meetingsViewModel;
  DateTime? dateFilter;
  BuildContext? _context;

  MeetingsDataTableSource(dynamic meetingsViewModel, {BuildContext? context}) {
    _meetingsViewModel = meetingsViewModel;
    _context = context;
  }
  RemoteDataSourceDetails<AttendanceScheduleModel>? _setDataDetails;

  RemoteDataSourceDetails<AttendanceScheduleModel>? get setDataDetails =>
      _setDataDetails;

  set setDataRows(
      RemoteDataSourceDetails<AttendanceScheduleModel> setDataDetails) {
    _setDataDetails = setDataDetails;
  }

  @override
  DataRow? getRow(int index) {
    // print({"lastDetails": lastDetails});
    if (lastDetails == null) {
      return null;
    } else {
      return rowGenerator(lastDetails!.rows[index]);
    }
  }

  rowGenerator(AttendanceScheduleModel meeting) {
    String? meetingName = meeting.name;
    String meetingType = meeting.type == 1 ? 'Meeting' : 'Event';
    int? meetingSpan = meeting.meetingSpan;
    String meetingSpanStr =
        meeting.meetingSpan == 1 ? '$meetingSpan day' : '$meetingSpan days';

    // print({"meeting_meeting_meeting_meeting": meeting});
    return DataRow(cells: [
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          height2_5SizeboxConstantsUtilities,
          Text(
            "$meetingName [$meetingType]",
            style: Theme.of(_context!).textTheme.bodyText2!.copyWith(
                  fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                    _context!,
                  ),
                ),
          ),
          height2_5SizeboxConstantsUtilities,
          Text(
            "Meeting Span - $meetingSpanStr",
            style: Theme.of(_context!).textTheme.bodyText2!.copyWith(
                  fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                    _context!,
                  ),
                ),
          ),
          height2_5SizeboxConstantsUtilities,
        ],
      )),
      DataCell(MeetingsDataTableSourceRight(meeting: meeting)),
    ]);
    // }
  }

  void selectedRow(int id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide() {
    var meetingsViewModel = _meetingsViewModel;

    String date = meetingsViewModel.date;
    dateFilter = date.isEmpty ? DateTime.now() : DateTime.parse(date);
    if (kDebugMode) {
      // print({"meetingsViewModel.date": meetingsViewModel.date, "dateFilter": dateFilter});
    }
    setNextView();
  }

  @override
  int get selectedRowCount => selectedIds.length;

  @override
  Future<RemoteDataSourceDetails<AttendanceScheduleModel>> getNextPage(
      NextPageRequest pageRequest) async {
    //the remote data source has to support the pagaing and sorting
    final queryParameter = <String, dynamic>{
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      'sortIndex': ((pageRequest.columnSortIndex ?? 0) + 1).toString(),
      'sortAsc': ((pageRequest.sortAscending ?? true) ? 1 : 0).toString(),
      // if (lastSearchTerm.isNotEmpty) 'companyFilter': lastSearchTerm,
    };

    // AttendanceMeetingNowDataTableViewModel meetingsViewModel =
    //     AttendanceMeetingNowDataTableViewModel();
    var meetingsViewModel = _meetingsViewModel;
    await meetingsViewModel.getData(queryParameter, date: dateFilter);
    // print({"meetingsViewModel.networkFailure": meetingsViewModel.networkFailure});
    // print({"meetingsViewModel.attendanceScheduleDatatable": meetingsViewModel.attendanceScheduleDatatable});

    if (meetingsViewModel.networkFailure != null) {
      // print({"meetingsViewModel.networkFailure": meetingsViewModel.networkFailure});
      throw Exception(meetingsViewModel.networkFailure);
    }
    if (meetingsViewModel.attendanceScheduleDatatable == null) {
      // print({"meetingsViewModel.networkFailure": meetingsViewModel.networkFailure});
      return RemoteDataSourceDetails(0, [], filteredRows: 0);
    }
    AttendanceScheduleDatatableModel? attendanceScheduleDatatable =
        meetingsViewModel.attendanceScheduleDatatable;
    if (kDebugMode) {
      // print({"attendanceScheduleDatatable": attendanceScheduleDatatable});
    }
    _setDataDetails = RemoteDataSourceDetails(
      attendanceScheduleDatatable!.recordsTotal!,
      attendanceScheduleDatatable.data!,
      filteredRows: attendanceScheduleDatatable.recordsFiltered,
    );
    notifyListeners();
    return _setDataDetails!;
  }
}
