import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/upcoming/card.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/upcoming/main.dart';

class UiUpcomingAttendancePagesHomeWidget extends StatefulWidget {
  final AttendanceScheduleUpcomingViewModel upcomingSchedules;
  final String title;
  const UiUpcomingAttendancePagesHomeWidget({
    Key? key,
    required this.upcomingSchedules,
    required this.title,
  }) : super(key: key);

  @override
  State<UiUpcomingAttendancePagesHomeWidget> createState() =>
      _UiUpcomingAttendancePagesHomeWidgetState();
}

class _UiUpcomingAttendancePagesHomeWidgetState
    extends State<UiUpcomingAttendancePagesHomeWidget> {
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
    if (widget.upcomingSchedules.loading) {
      return const LoadingWidget1();
    }

    if (widget.upcomingSchedules.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: widget.upcomingSchedules.networkFailure,
      );
    }
    List<AttendanceScheduleModel> attendanceSchedules =
        widget.upcomingSchedules.attendanceSchedule;
    if (kDebugMode) {
      // print({"attendanceSchedules": attendanceSchedules});
    }
    // attendanceSchedules = [];
    final listLength = attendanceSchedules.length;
    return listLength > 0
        ? ListView(
            controller: scrollController,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.horizontal,
            children: attendanceSchedules
                .map((meeting) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: UiCardUpcomingAttendancePagesHomeWidget(
                        meeting: meeting,
                      ),
                    ))
                .toList())
        : Card(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "No ${widget.title} Found",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          );
  }
}
