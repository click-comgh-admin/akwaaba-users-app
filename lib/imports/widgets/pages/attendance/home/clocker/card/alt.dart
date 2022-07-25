import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/breaks/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/clocking/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info_dialog.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/break/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/break/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/meeting_place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UiCardAltClockerAttendancePagesHomeWidget extends StatefulWidget {
  final AttendanceScheduleModel meeting;
  final double cardHeight;
  const UiCardAltClockerAttendancePagesHomeWidget(
      {Key? key, required this.meeting, required this.cardHeight})
      : super(key: key);

  @override
  State<UiCardAltClockerAttendancePagesHomeWidget> createState() =>
      _UiCardAltClockerAttendancePagesHomeWidgetState();
}

class _UiCardAltClockerAttendancePagesHomeWidgetState
    extends State<UiCardAltClockerAttendancePagesHomeWidget> {
  static String? _upcomingDate;
  static String _meetingDate = "-";
  static bool _calledMeetingDate = false;
  static String _virtualMeetingTypeStr = "-";
  static String _meetingLocationStr = "-";
  static WPAHmeetingBreaks _meetingBreaks = const WPAHmeetingBreaks(
    start: "-",
    end: "-",
  );
  String? get upcomingDate => _upcomingDate;

  bool get calledMeetingDate => _calledMeetingDate;

  String get meetingDate => _meetingDate;

  String get virtualMeetingTypeStr => _virtualMeetingTypeStr;

  String get meetingLocationStr => _meetingLocationStr;

  WPAHmeetingBreaks get meetingBreaks => _meetingBreaks;

  set setUpcomingDate(String? upcomingDate) {
    _upcomingDate = upcomingDate;
  }

  set setCalledMeetingDate(bool calledMeetingDate) {
    _calledMeetingDate = calledMeetingDate;
  }

  set setMeetingDate(String meetingDate) {
    _meetingDate = meetingDate;
  }

  set setVirtualMeetingTypeStr(String virtualMeetingTypeStr) {
    _virtualMeetingTypeStr = virtualMeetingTypeStr;
  }

  set setMeetingLocationStr(String meetingLocationStr) {
    _meetingLocationStr = meetingLocationStr;
  }

  set setMeetingBreaks(WPAHmeetingBreaks meetingBreaks) {
    _meetingBreaks = meetingBreaks;
  }

  @override
  void initState() {
    super.initState();
    networkCalls(context);
  }

  networkCalls(BuildContext context) {
    getVirtualMeetingType(
      context,
    );
    getMeetingPlace(
      context,
    );
    if (widget.meeting.hasBreakTime!) {
      getBreakTime(
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AttendanceClockingAttendanceViewModel clockingInfoViewModel =
        context.watch<AttendanceClockingAttendanceViewModel>();
    // clockingInfoViewModel.memberAttendance(
    //   meetingId: meeting.id!,
    // );
    String meetingType = widget.meeting.type == 1 ? 'Meeting' : 'Event';
    int? meetingSpan = widget.meeting.meetingSpan;
    String meetingSpanStr = widget.meeting.meetingSpan == 1
        ? '$meetingSpan day'
        : '$meetingSpan days';

    DateTime now = DateTime.now();
    // DateTime now = DateTime.parse("2012-02-27");

    String date = formatDateDatetimeFunction(now);
    _meetingDate = date;

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
        // height: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
        //         ? widget.cardHeight + 100
        //         : widget.cardHeight,
        // child: ConstrainedBox(
        //   constraints: BoxConstraints(
        //     maxHeight: widget.cardHeight,
        //     minHeight: widget.cardHeight /2,
        //     maxWidth: double.infinity,
        //     minWidth: double.infinity,
        //   ),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Starts: $startTime"),
                      const Text("  -  "),
                      Text("Ends: $closeTime"),
                    ],
                  ),
                  FutureBuilder(
                    future: clockingInfoViewModel.memberAttendanceAlt(
                      meetingId: widget.meeting.id,
                    ),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget1();
                      }

                      TextStyle? textStyle =
                          Theme.of(context).textTheme.bodyText2;

                      if (snapshot.hasError) {
                        return Text(
                          "Clocking Info: ${snapshot.error} :: error occured",
                          style: textStyle!.copyWith(color: Colors.red),
                        );
                      }
                      if (snapshot.hasData) {
                        var data = snapshot.data!;
                        if (data is NetworkSuccess) {
                          AttendanceClockingAttendanceDetailsModel
                              userClockingInfo = data.response
                                  as AttendanceClockingAttendanceDetailsModel;
                          // print({
                          //   "userClockingInfo-${widget.meeting.name}":
                          //       userClockingInfo
                          // });
                          return Column(
                            children: [
                              ClockingUiCardClockerAttendancePagesHomeWidget(
                                meeting: widget.meeting,
                                clockingInfo: userClockingInfo,
                              ),
                              BreaksUiCardClockerAttendancePagesHomeWidget(
                                meeting: widget.meeting,
                                clockingInfo: userClockingInfo,
                              ),
                            ],
                          );
                        }
                        if (data is NetworkFailure) {
                          return NetworkErrorWidget(
                            networkFailure: data,
                          );
                        }
                      }
                      return Text(
                        "Clocking Info: $date",
                        style: textStyle,
                      );
                    },
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

  getBreakTime(
    BuildContext ctx,
  ) async {
    AttendanceScheduleBreakViewModel scheduleBreak =
        Provider.of<AttendanceScheduleBreakViewModel>(ctx, listen: false);

    var scheduleBreakAlt =
        await scheduleBreak.scheduleBreakAlt(widget.meeting.id!);

    if (scheduleBreakAlt is NetworkSuccess) {
      if (scheduleBreakAlt.response != null) {
        AttendanceScheduleBreakModel attendanceScheduleBreak =
            scheduleBreakAlt.response as AttendanceScheduleBreakModel;
        // print({"attendanceScheduleDates": attendanceScheduleDates});
        String startBreak = formatTimeDatetimeFunction(DateTime.parse(
            "${meetingDate}T${attendanceScheduleBreak.startBreak!}"));
        String endBreak = formatTimeDatetimeFunction(DateTime.parse(
            "${meetingDate}T${attendanceScheduleBreak.endBreak!}"));

        _meetingBreaks = WPAHmeetingBreaks(start: startBreak, end: endBreak);
      }
    }
  }

  getVirtualMeetingType(
    BuildContext ctx,
  ) async {
    AttendanceSchedulePlaceViewModel virtualMeetingType =
        Provider.of<AttendanceSchedulePlaceViewModel>(ctx, listen: false);

    var getVirtualMeetingType = await virtualMeetingType.virtualMeetingType(
      virtualMeetingTypeId: widget.meeting.virtualMeetingType!,
    );

    if (getVirtualMeetingType is NetworkSuccess) {
      TypesModel virtualMeetingTypeModel =
          getVirtualMeetingType.response as TypesModel;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      _virtualMeetingTypeStr = virtualMeetingTypeModel.name!;
    }
  }

  getMeetingPlace(
    BuildContext ctx,
  ) async {
    AttendanceSchedulePlaceViewModel meetingPlace =
        Provider.of<AttendanceSchedulePlaceViewModel>(ctx, listen: false);

    var getSchedulePlace = await meetingPlace.schedulePlace(
      schedulePlaceId: widget.meeting.meetingLocation!,
    );

    if (getSchedulePlace is NetworkSuccess) {
      TypesModel meetingPlaceTypeModel =
          getSchedulePlace.response as TypesModel;
      // print({"attendanceScheduleDates": attendanceScheduleDates});
      _meetingLocationStr = meetingPlaceTypeModel.name!;
    }
  }
}
