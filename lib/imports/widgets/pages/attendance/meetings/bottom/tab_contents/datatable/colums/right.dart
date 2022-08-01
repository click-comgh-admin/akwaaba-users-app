import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/utilities/extentions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info_dialog.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/break/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/dates.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/days.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/break/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/dates.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/days.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/meeting_place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeetingsDataTableSourceRight extends StatefulWidget {
  final AttendanceScheduleModel meeting;
  const MeetingsDataTableSourceRight({Key? key, required this.meeting})
      : super(key: key);

  @override
  State<MeetingsDataTableSourceRight> createState() =>
      _MeetingsDataTableSourceRightState();
}

class _MeetingsDataTableSourceRightState
    extends State<MeetingsDataTableSourceRight> {
  bool getDataCalled = false;
  DateTime? meetingDate;
  String virtualMeetingTypeStr = "-";
  String meetingLocationStr = "-";
  WPAHmeetingBreaks meetingBreaks = WPAHmeetingBreaks(start: "-", end: "-");

  @override
  void initState() {
    super.initState();
    getDate(
      context,
      meeting: widget.meeting,
    ).then((value) {
      // print({"value_value_value": value});
      setState(() {
        meetingDate = value;
        getDataCalled = true;
      });
    });
    getVirtualMeetingType(context);
    getMeetingPlace(context);
    if (widget.meeting.hasBreakTime!) {
      getBreakTime(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print({"getDataCalled": getDataCalled});
    if (getDataCalled) {
      String meetingType = widget.meeting.type == 1 ? 'Meeting' : 'Event';
      int? meetingSpan = widget.meeting.meetingSpan;
      String meetingSpanStr = widget.meeting.meetingSpan == 1
          ? '$meetingSpan day'
          : '$meetingSpan days';

      DateTime now = DateTime.now();
      // DateTime now = DateTime.parse("2012-02-27");

      String nowDate = formatDateDatetimeFunction(now);
      String date;
      if (meetingDate == null) {
        date = nowDate;
      } else {
        date = formatDateDatetimeFunction(meetingDate!);
      }

      String startTime = emptyOrNull(widget.meeting.startTime)
          ? "-"
          : formatTimeDatetimeFunction(
              DateTime.parse("${date}T${widget.meeting.startTime!}"));
      String closeTime = emptyOrNull(widget.meeting.closeTime)
          ? "-"
          : formatTimeDatetimeFunction(
              DateTime.parse("${date}T${widget.meeting.closeTime!}"));
      // print({"widget.meeting": widget.meeting});
      String latenessTime = emptyOrNull(widget.meeting.latenessTime)
          ? "-"
          : formatTimeDatetimeFunction(
              DateTime.parse("${date}T${widget.meeting.latenessTime!}"));

      bool hasVirtualMeeting = widget.meeting.meetingLocation == 3 ||
              widget.meeting.meetingLocation == 4
          ? true
          : false;
      WPAHmeetingBreaksDialogIcon iconButton = WPAHmeetingBreaksDialogIcon(
        meetingType: meetingType,
        meetingName: widget.meeting.name!,
        meetingSpanStr: meetingSpanStr,
        meetingDate: date,
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
      );
      // print({"meetingDate": meetingDate});
      if (meetingDate == null) {
        return iconButton;
      } else {
        return Row(
          children: [
            Text(
              formatDateDatetimeFunction(meetingDate!),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
            width10SizeboxConstantsUtilities,
            iconButton,
          ],
        );
      }
    } else {
      return const LoadingWidget1();
    }
  }

  Future<DateTime?> getDate(
    BuildContext ctx, {
    required AttendanceScheduleModel meeting,
  }) async {
    AttendanceScheduleDayViewModel scheduleDays =
        Provider.of<AttendanceScheduleDayViewModel>(ctx, listen: false);
    AttendanceScheduleDateViewModel scheduleDates =
        Provider.of<AttendanceScheduleDateViewModel>(ctx, listen: false);
    DateTime now = DateTime.now();
    // print({"now-now-now-now": now});

    DateTime? date;
    if (meeting.isRecuring!) {
      date = await meetingDays(
        ctx,
        meeting.id!,
        now: now,
        scheduleDays: scheduleDays,
      );
      // print({"date-date": date});
    } else {
      date = await meetingDates(
        ctx,
        meeting.id!,
        now: now,
        scheduleDates: scheduleDates,
      );
    }
    // print({"date_date_date": date});
    return date;
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

  getBreakTime(ctx) async {
    AttendanceScheduleBreakViewModel scheduleBreak =
        Provider.of<AttendanceScheduleBreakViewModel>(ctx, listen: false);

    var scheduleBreakAlt =
        await scheduleBreak.scheduleBreakAlt(widget.meeting.id!);
    DateTime now = DateTime.now();
    String nowDate = formatDateDatetimeFunction(now);

    if (scheduleBreakAlt is NetworkSuccess) {
      // print({"scheduleBreakAlt_scheduleBreakAlt": scheduleBreakAlt});
      if (scheduleBreakAlt.response != null) {
        AttendanceScheduleBreakModel attendanceScheduleBreak =
            scheduleBreakAlt.response as AttendanceScheduleBreakModel;
        // print({"attendanceScheduleBreak": attendanceScheduleBreak});
        String startBreak = formatTimeDatetimeFunction(DateTime.parse(
            "${nowDate}T${attendanceScheduleBreak.startBreak!}"));
        String endBreak = formatTimeDatetimeFunction(
            DateTime.parse("${nowDate}T${attendanceScheduleBreak.endBreak!}"));

        meetingBreaks = WPAHmeetingBreaks(start: startBreak, end: endBreak);
        // print({"meetingBreaks": meetingBreaks});
      }
    }
  }
}

emptyOrNull(String? str) {
  if (str == null) {
    return true;
  } else {
    if (str.isEmpty) return true;

    return false;
  }
}
