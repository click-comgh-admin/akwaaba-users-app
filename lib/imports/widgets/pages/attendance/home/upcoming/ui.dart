import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/utilities/extentions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/upcoming/card.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/dates.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/days.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/dates.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/days.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/upcoming/main.dart';
import 'package:provider/provider.dart';

// TODO: WORK ON THIS PAGE
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

  bool calledMeetingDate = false;
  List<AttendanceScheduleFilterModel>? meetingsWithSortedDates = [];

  @override
  Widget build(BuildContext context) {
    // print({"calledMeetingDate": calledMeetingDate});
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

    return calledMeetingDate
        ? dataUi(meetingsWithSortedDates)
        : FutureBuilder(
            future: sortUpcomingList(
              context,
              attendanceSchedules: attendanceSchedules,
            ),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<AttendanceScheduleFilterModel>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget1();
              }
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                        fontSize:
                            body2FontSizeResponsiveSizingContantsUtilities(
                          context,
                        ),
                      ),
                );
              }

              if (snapshot.hasData) {
                List<AttendanceScheduleFilterModel>? data = snapshot.data;
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  setState(() {
                    calledMeetingDate = true;
                    meetingsWithSortedDates = data;
                  });
                });

                return dataUi(data);
              }
              return Text(
                "Fetal Error!",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.red,
                      fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                        context,
                      ),
                    ),
              );
            },
          );
  }

  StatelessWidget dataUi(List<AttendanceScheduleFilterModel>? data) {
    final listLength = data!.length;
    return listLength > 0
        ? ListView(
            controller: scrollController,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.horizontal,
            children: data
                .map(
                  (meeting) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: UiCardUpcomingAttendancePagesHomeWidget(
                      meeting: meeting.meeting,
                      date: meeting.date,
                    ),
                  ),
                )
                .toList(),
          )
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

  Future<List<AttendanceScheduleFilterModel>> sortUpcomingList(
    BuildContext ctx, {
    required List<AttendanceScheduleModel> attendanceSchedules,
  }) async {
    AttendanceScheduleDayViewModel scheduleDays =
        Provider.of<AttendanceScheduleDayViewModel>(ctx, listen: false);
    AttendanceScheduleDateViewModel scheduleDates =
        Provider.of<AttendanceScheduleDateViewModel>(ctx, listen: false);
    DateTime now = DateTime.now();
    // print({"now-now-now-now": now});

    List<AttendanceScheduleFilterModel> cis = [];
    for (var meeting in attendanceSchedules) {
      // print({"meeting-meeting-meeting-meeting": meeting});
      if (meeting.isRecuring!) {
        DateTime? date = await meetingDays(
          ctx,
          meeting.id!,
          now: now,
          scheduleDays: scheduleDays,
        );
        // print({"date-date": date});
        AttendanceScheduleFilterModel ci =
            AttendanceScheduleFilterModel(date: date!, meeting: meeting);
        if (!cis.contains(ci)) {
          cis.add(ci);
        }
      } else {
        DateTime? date = await meetingDates(
          ctx,
          meeting.id!,
          now: now,
          scheduleDates: scheduleDates,
        );
        AttendanceScheduleFilterModel ci =
            AttendanceScheduleFilterModel(date: date!, meeting: meeting);
        if (!cis.contains(ci)) {
          cis.add(ci);
        }
      }
    }
    cis.sort((a, b) => a.date.compareTo(b.date));

    return cis;
  }

  Future<DateTime?> meetingDays(
    BuildContext ctx,
    int meetingId, {
    required DateTime now,
    required AttendanceScheduleDayViewModel scheduleDays,
  }) async {
    var scheduleDaysAlt = await scheduleDays.scheduleDaysAlt(meetingId);
    // print({"scheduleDaysAlt": scheduleDaysAlt});
    DateTime? acceptedDate;
    if (scheduleDaysAlt is NetworkSuccess) {
      List<AttendanceScheduleDayModel> attendanceScheduleDates =
          scheduleDaysAlt.response as List<AttendanceScheduleDayModel>;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      for (var attendanceScheduleDate in attendanceScheduleDates) {
        int dayId = attendanceScheduleDate.dayId!;
        // print({"dayId-dayId-dayId": dayId});

        DateTime scheduleDate = now.next(dayId);
        // print({"scheduleDate": scheduleDate});

        // print({"scheduleDate": scheduleDate});
        // print({"now.compareTo(scheduleDate)-dAy": now.compareTo(scheduleDate)});
        if (now.compareTo(scheduleDate) <= 0) {
          // print({"scheduleDate": scheduleDate});
          acceptedDate ??= scheduleDate;
        }
      }
    }
    return acceptedDate;
  }

  Future<DateTime?> meetingDates(
    BuildContext ctx,
    int meetingId, {
    required DateTime now,
    required AttendanceScheduleDateViewModel scheduleDates,
  }) async {
    var scheduleDatesAlt = await scheduleDates.scheduleDatesAlt(meetingId);
    DateTime? acceptedDate;
    // print({"scheduleDatesAlt": scheduleDatesAlt});
    if (scheduleDatesAlt is NetworkSuccess) {
      List<AttendanceScheduleDateModel> attendanceScheduleDates =
          scheduleDatesAlt.response as List<AttendanceScheduleDateModel>;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      DateTime? acceptedDate;
      for (var attendanceScheduleDate in attendanceScheduleDates) {
        DateTime scheduleDate = attendanceScheduleDate.date!;
        // print({"scheduleDate": scheduleDate});
        // print({"now.compareTo(scheduleDate)": now.compareTo(scheduleDate)});
        if (now.compareTo(scheduleDate) <= 0) {
          // print({"scheduleDate": scheduleDate});
          acceptedDate ??= scheduleDate;
        }
      }
    }
    return acceptedDate;
  }
}
