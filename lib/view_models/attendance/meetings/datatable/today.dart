import 'package:akwaaba_user_app/imports/classes/network/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/datatable/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/datatable/main.dart';

class AttendanceMeetingTodayDataTableViewModel
    extends AttendanceMeetingDataTableViewModel {
  @override
  Future<bool> getData(Map<String, dynamic> queryParameter,
      {DateTime? date}) async {
    queryParameter['filter_recuring'] = "both";
    var successful = false;
    var response = await AttendanceScheduleNetwork.meetingDatatable(
      MeetingViewTypes.now,
      queryParameter: queryParameter,
    );

    if (response is NetworkSuccess) {
      super.setAttendanceScheduleDatatableModel =
          response.response as AttendanceScheduleDatatableModel;
      successful = true;
    }
    if (response is NetworkFailure) {
      super.setNetworkFailure = response;
      successful = false;
    }
    return successful;
  }
}
