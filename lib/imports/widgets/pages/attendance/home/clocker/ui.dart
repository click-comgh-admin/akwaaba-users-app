import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/alt.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/today/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class UiClockerAttendancePagesHomeWidget extends StatefulWidget {
  final AttendanceScheduleTodayViewModel todaySchedules;
  final String title;
  const UiClockerAttendancePagesHomeWidget({
    Key? key,
    required this.todaySchedules,
    required this.title,
  }) : super(key: key);

  @override
  State<UiClockerAttendancePagesHomeWidget> createState() =>
      _UiClockerAttendancePagesHomeWidgetState();
}

class _UiClockerAttendancePagesHomeWidgetState
    extends State<UiClockerAttendancePagesHomeWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double cardHeight = 400.0;
    if (widget.todaySchedules.loading) {
      return const LoadingWidget1();
    }

    if (widget.todaySchedules.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: widget.todaySchedules.networkFailure,
      );
    }
    List<AttendanceScheduleModel> attendanceSchedules =
        widget.todaySchedules.attendanceSchedule;
    if (kDebugMode) {
      // print({"attendanceSchedules": attendanceSchedules});
    }
    // attendanceSchedules = [];
    final listLength = attendanceSchedules.length;
    return listLength > 0
        ? SizedBox(
        height: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? (cardHeight + 120) * attendanceSchedules.length
                : (cardHeight + 20) * attendanceSchedules.length,
            child: ListView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                children: attendanceSchedules.map((meeting) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: UiCardAltClockerAttendancePagesHomeWidget(
                      cardHeight: cardHeight,
                      meeting: meeting,
                    ),
                  );
                }).toList()),
          )
        : Card(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "No meetings for today",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          );
  }
}
