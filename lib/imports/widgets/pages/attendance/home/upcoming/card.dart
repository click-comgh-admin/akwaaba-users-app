import 'package:akwaaba_user_app/imports/utilities/constants/sizing/height/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info_dialog.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/break/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/meeting_place.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/break/main.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UiCardUpcomingAttendancePagesHomeWidget extends StatefulWidget {
  final DateTime date;
  final AttendanceScheduleModel meeting;
  const UiCardUpcomingAttendancePagesHomeWidget({
    Key? key,
    required this.meeting,
    required this.date,
  }) : super(key: key);

  @override
  State<UiCardUpcomingAttendancePagesHomeWidget> createState() =>
      _UiCardUpcomingAttendancePagesHomeWidgetState();
}

class _UiCardUpcomingAttendancePagesHomeWidgetState
    extends State<UiCardUpcomingAttendancePagesHomeWidget>
    with AutomaticKeepAliveClientMixin {
  String? upcomingDate;
  bool calledMeetingDate = false;
  String meetingDate = "-";
  String virtualMeetingTypeStr = "-";
  String meetingLocationStr = "-";
  WPAHmeetingBreaks meetingBreaks = WPAHmeetingBreaks(start: "-", end: "-");
  @override
  void initState() {
    getVirtualMeetingType(context);
    getMeetingPlace(context);
    if (widget.meeting.hasBreakTime!) {
      getBreakTime(context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String meetingType = widget.meeting.type == 1 ? 'Meeting' : 'Event';
    int? meetingSpan = widget.meeting.meetingSpan;
    String meetingSpanStr = widget.meeting.meetingSpan == 1
        ? '$meetingSpan day'
        : '$meetingSpan days';

    // DateTime now = DateTime.now();
    // DateTime now = DateTime.parse("2012-02-27");

    // String date = formatDateDatetimeFunction(now);
    String date = formatDateDatetimeFunction(widget.date);
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
        width: 165,
        height: topCardHeightConstantsUtilities,
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
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize:
                              body2FontSizeResponsiveSizingContantsUtilities(
                            context,
                          ),
                        ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date: $date",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize:
                                  body2FontSizeResponsiveSizingContantsUtilities(
                                context,
                              ),
                            ),
                      ),
                      Text(
                        "$meetingType Span: $meetingSpanStr",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize:
                                  body2FontSizeResponsiveSizingContantsUtilities(
                                context,
                              ),
                            ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start time: $startTime",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize:
                                  body2FontSizeResponsiveSizingContantsUtilities(
                                context,
                              ),
                            ),
                      ),
                      Text(
                        "End time: $closeTime",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize:
                                  body2FontSizeResponsiveSizingContantsUtilities(
                                context,
                              ),
                            ),
                      ),
                    ],
                  ),
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
      // print({"scheduleBreakAlt_scheduleBreakAlt": scheduleBreakAlt});
      if (scheduleBreakAlt.response != null) {
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

  @override
  bool get wantKeepAlive => true;
}
