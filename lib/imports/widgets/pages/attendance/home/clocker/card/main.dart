import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info_dialog.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/break/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/dates.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/meeting_place.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/break/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/dates.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UiCardClockerAttendancePagesHomeWidget extends StatefulWidget {
  final AttendanceScheduleModel meeting;
  final double cardHeight;
  const UiCardClockerAttendancePagesHomeWidget({
    Key? key,
    required this.meeting,
    required this.cardHeight,
  }) : super(key: key);

  @override
  State<UiCardClockerAttendancePagesHomeWidget> createState() =>
      _UiCardClockerAttendancePagesHomeWidgetState();
}

class _UiCardClockerAttendancePagesHomeWidgetState
    extends State<UiCardClockerAttendancePagesHomeWidget> {
  String? upcomingDate;
  bool calledMeetingDate = false;
  String meetingDate = "-";
  String virtualMeetingTypeStr = "-";
  String meetingLocationStr = "-";
  WPAHmeetingBreaks meetingBreaks = const WPAHmeetingBreaks(
    start: "-",
    end: "-",
  );
  @override
  void initState() {
    // attendanceClockingAttendanceViewModel.setScheduleId(widget.meeting.id!);
    // attendanceClockingAttendanceViewModel.memberAttendance();

    getVirtualMeetingType(context);
    getMeetingPlace(context);
    if (widget.meeting.hasBreakTime!) {
      getBreakTime(context);
    }
    super.initState();
  }

  Future<String> meetingDates(
    BuildContext ctx, {
    required DateTime now,
    required String date,
  }) async {
    AttendanceScheduleDateViewModel scheduleDates =
        Provider.of<AttendanceScheduleDateViewModel>(ctx, listen: false);
    var scheduleDatesAlt =
        await scheduleDates.scheduleDatesAlt(widget.meeting.id!);
    // print({"scheduleDatesAlt": scheduleDatesAlt});
    if (scheduleDatesAlt is NetworkSuccess) {
      List<AttendanceScheduleDateModel> attendanceScheduleDates =
          scheduleDatesAlt.response as List<AttendanceScheduleDateModel>;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      DateTime? acceptedDate;
      for (var attendanceScheduleDate in attendanceScheduleDates) {
        DateTime scheduleDate = attendanceScheduleDate.date!;
        // print({"scheduleDate": scheduleDate});
        // print({"scheduleDate.compareTo(now)": scheduleDate.compareTo(now)});
        if (scheduleDate.compareTo(now) <= 0) {
          // print({"scheduleDate": scheduleDate});
          acceptedDate ??= scheduleDate;
        }
      }
      if (acceptedDate != null) {
        date = formatDateDatetimeFunction(acceptedDate);
      }
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    AttendanceClockingAttendanceViewModel
        attendanceClockingAttendanceViewModel =
        context.watch<AttendanceClockingAttendanceViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      attendanceClockingAttendanceViewModel.setScheduleId(widget.meeting.id!);
      attendanceClockingAttendanceViewModel.memberAttendance();
    });
    String meetingType = widget.meeting.type == 1 ? 'Meeting' : 'Event';
    int? meetingSpan = widget.meeting.meetingSpan;
    String meetingSpanStr = widget.meeting.meetingSpan == 1
        ? '$meetingSpan day'
        : '$meetingSpan days';

    DateTime now = DateTime.now();
    // DateTime now = DateTime.parse("2012-02-27");

    String date = formatDateDatetimeFunction(now);
    meetingDate = date;

    String startTime = formatTimeDatetimeFunction(
        DateTime.parse("${date}T${widget.meeting.startTime!}"));
    String closeTime = formatTimeDatetimeFunction(
        DateTime.parse("${date}T${widget.meeting.closeTime!}"));
    String latenessTime = formatTimeDatetimeFunction(
        DateTime.parse("${date}T${widget.meeting.latenessTime!}"));

    bool hasVirtualMeeting = widget.meeting.meetingLocation == 3 ||
            widget.meeting.meetingLocation == 4
        ? true
        : false;
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: widget.cardHeight,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.meeting.name} - [$meetingType]",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date: $date",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        "$meetingType Span: $meetingSpanStr",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start time: $startTime"),
                      Text("End time: $closeTime"),
                    ],
                  ),
                  // BreaksUiCardClockerAttendancePagesHomeWidget(
                  //   meeting: widget.meeting,
                  // ),
                  // ClockingUiCardClockerAttendancePagesHomeWidget(
                  //   meeting: widget.meeting,
                  // ),
                ],
              ),
            ),
            Positioned(
              top: -5,
              right: -10,
              child: WPAHmeetingBreaksDialogIcon(
                meetingType: meetingType,
                meetingName: widget.meeting.name!,
                meetingSpanStr: meetingSpanStr,
                meetingDate: meetingDate,
                startTime: startTime,
                closeTime: closeTime,
                hasBreakTime: widget.meeting.hasBreakTime!,
                meetingLocationStr: meetingLocationStr,
                virtualMeetingTypeStr: virtualMeetingTypeStr,
                hasVirtualMeeting: hasVirtualMeeting,
                virtualMeetingLink: widget.meeting.virtualMeetingLink!,
                latenessTime: latenessTime,
                meetingBreaks: meetingBreaks,
                expectedMonthlyAttendance:
                    widget.meeting.expectedMonthlyAttendance.toString(),
                activeMonthlyAttendance:
                    widget.meeting.activeMonthlyAttendance.toString(),
                agenda: widget.meeting.agenda!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getBreakTime(ctx) async {
    AttendanceScheduleBreakViewModel scheduleBreak =
        Provider.of<AttendanceScheduleBreakViewModel>(ctx, listen: false);

    var scheduleBreakAlt =
        await scheduleBreak.scheduleBreakAlt(widget.meeting.id!);

    if (scheduleBreakAlt is NetworkSuccess) {
      AttendanceScheduleBreakModel attendanceScheduleBreak =
          scheduleBreakAlt.response as AttendanceScheduleBreakModel;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      String startBreak = formatTimeDatetimeFunction(DateTime.parse(
          "${meetingDate}T${attendanceScheduleBreak.startBreak!}"));
      String endBreak = formatTimeDatetimeFunction(DateTime.parse(
          "${meetingDate}T${attendanceScheduleBreak.endBreak!}"));

      meetingBreaks = WPAHmeetingBreaks(start: startBreak, end: endBreak);
    }
  }

  getVirtualMeetingType(ctx) async {
    AttendanceSchedulePlaceViewModel virtualMeetingType =
        Provider.of<AttendanceSchedulePlaceViewModel>(ctx, listen: false);

    var getVirtualMeetingType = await virtualMeetingType.virtualMeetingType(
      virtualMeetingTypeId: widget.meeting.virtualMeetingType!,
    );

    if (getVirtualMeetingType is NetworkSuccess) {
      TypesModel virtualMeetingTypeModel =
          getVirtualMeetingType.response as TypesModel;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      virtualMeetingTypeStr = virtualMeetingTypeModel.name!;
    }
  }

  getMeetingPlace(ctx) async {
    AttendanceSchedulePlaceViewModel meetingPlace =
        Provider.of<AttendanceSchedulePlaceViewModel>(ctx, listen: false);

    var getSchedulePlace = await meetingPlace.schedulePlace(
      schedulePlaceId: widget.meeting.meetingLocation!,
    );

    if (getSchedulePlace is NetworkSuccess) {
      TypesModel meetingPlaceTypeModel =
          getSchedulePlace.response as TypesModel;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      meetingLocationStr = meetingPlaceTypeModel.name!;
    }
  }
}
