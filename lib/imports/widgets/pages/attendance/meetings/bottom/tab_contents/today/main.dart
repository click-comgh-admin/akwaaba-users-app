import 'package:advanced_datatable/datatable.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/tab_contents/datatable/main.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/tabbar/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/datatable/today.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/tab_bar/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabContentTodayBottomMeetingsPageSettingsWidget extends StatefulWidget {
  const TabContentTodayBottomMeetingsPageSettingsWidget({Key? key})
      : super(key: key);

  @override
  State<TabContentTodayBottomMeetingsPageSettingsWidget> createState() =>
      _TabContentTodayBottomMeetingsPageSettingsWidgetState();
}

class _TabContentTodayBottomMeetingsPageSettingsWidgetState
    extends State<TabContentTodayBottomMeetingsPageSettingsWidget> {
  AttendanceMeetingTabBarModel? tabInfo;
  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  MeetingsDataTableSource meetingsDataTableSource = MeetingsDataTableSource(
    AttendanceMeetingTodayDataTableViewModel(),
  );
  final _customFooter = false;
  final _sortIndex = 0;
  final _sortAsc = true;
  // final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    meetingsDataTableSource = MeetingsDataTableSource(
      Provider.of<AttendanceMeetingTodayDataTableViewModel>(
        context,
        listen: false,
      ),
      context: context,
    );
    AttendanceMeetingTabBarViewModel amtbViewModel =
        Provider.of<AttendanceMeetingTabBarViewModel>(context, listen: false);
    for (var tab in amtbViewModel.tabs) {
      if (tab.index == amtbViewModel.initialIndex) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {
            tabInfo = tab;
            // amtbViewModel.setInitialIndex = tabInfo!.index;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // AttendanceMeetingTabBarViewModel amtbViewModel =
    //     context.watch<AttendanceMeetingTabBarViewModel>();
    // AttendanceMeetingTodayDataTableViewModel meetingDatabaseViewModel =
    //     context.watch<AttendanceMeetingTodayDataTableViewModel>();
    if (tabInfo == null) {
      return const Center(
        child: LoadingWidget1(),
      );
    } else {
      return AdvancedPaginatedDataTable(
        addEmptyRows: false,
        source: meetingsDataTableSource,
        showHorizontalScrollbarAlways: true,
        sortAscending: _sortAsc,
        sortColumnIndex: _sortIndex,
        showFirstLastButtons: true,
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const [10, 20, 30, 50],
        onRowsPerPageChanged: (newRowsPerPage) {
          if (newRowsPerPage != null) {
            setState(() {
              _rowsPerPage = newRowsPerPage;
            });
          }
        },
        columns: [
          DataColumn(
            label: Text(
              'Meeting',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
          ),
          DataColumn(
            label: Text(
              'Info',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
          ),
        ],
        getFooterRowText:
            (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
          final localizations = MaterialLocalizations.of(context);
          var amountText = localizations.pageRowsInfoTitle(
            startRow,
            pageSize,
            totalFilter ?? totalRowsWithoutFilter,
            false,
          );

          if (totalFilter != null) {
            //Filtered data source show addtional information
            amountText += ' filtered from ($totalRowsWithoutFilter)';
          }

          return amountText;
        },
        customTableFooter: _customFooter
            ? (source, offset) {
                const maxPagesToShow = 6;
                const maxPagesBeforeCurrent = 3;
                final lastRequestDetails = source.lastDetails!;
                final rowsForPager = lastRequestDetails.filteredRows ??
                    lastRequestDetails.totalRows;
                final totalPages = rowsForPager ~/ _rowsPerPage;
                final currentPage = (offset ~/ _rowsPerPage) + 1;
                final List<int> pageList = [];
                if (currentPage > 1) {
                  pageList.addAll(
                    List.generate(currentPage - 1, (index) => index + 1),
                  );
                  //Keep up to 3 pages before current in the list
                  pageList.removeWhere(
                    (element) => element < currentPage - maxPagesBeforeCurrent,
                  );
                }
                pageList.add(currentPage);
                //Add reminding pages after current to the list
                pageList.addAll(
                  List.generate(
                    maxPagesToShow - (pageList.length - 1),
                    (index) => (currentPage + 1) + index,
                  ),
                );
                pageList.removeWhere((element) => element > totalPages);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: pageList
                      .map(
                        (e) => TextButton(
                          onPressed: e != currentPage
                              ? () {
                                  //Start index is zero based
                                  source.setNextView(
                                    startIndex: (e - 1) * _rowsPerPage,
                                  );
                                }
                              : null,
                          child: Text(
                            e.toString(),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize:
                                          body2FontSizeResponsiveSizingContantsUtilities(
                                        context,
                                      ),
                                    ),
                          ),
                        ),
                      )
                      .toList(),
                );
              }
            : null,
      );
    }
  }
}
