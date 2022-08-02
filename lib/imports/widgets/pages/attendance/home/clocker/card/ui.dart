import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/breaks/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/clocking/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubUiCardAltClockerAttendancePagesHomeWidget extends StatefulWidget {
  final AttendanceScheduleModel meeting;
  const SubUiCardAltClockerAttendancePagesHomeWidget({
    Key? key,
    required this.meeting,
  }) : super(key: key);

  @override
  State<SubUiCardAltClockerAttendancePagesHomeWidget> createState() =>
      _SubUiCardAltClockerAttendancePagesHomeWidgetState();
}

class _SubUiCardAltClockerAttendancePagesHomeWidgetState
    extends State<SubUiCardAltClockerAttendancePagesHomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  getClockingInfo(AttendanceClockingAttendanceViewModel acaViewModel) {
    AttendanceClockingAttendanceDetailsModel? userClockingInfo;
    for (var clockingInfoDetails in acaViewModel.clockingInfosDetails) {
      if (clockingInfoDetails.meetingEventId!.id == widget.meeting.id) {
        userClockingInfo = clockingInfoDetails;
      }
    }
    return userClockingInfo;
  }

  @override
  Widget build(BuildContext context) {
    AttendanceClockingAttendanceViewModel
        attendanceClockingAttendanceViewModel =
        context.watch<AttendanceClockingAttendanceViewModel>();
    if (attendanceClockingAttendanceViewModel.loading) {
      return const LoadingWidget1();
    }

    if (attendanceClockingAttendanceViewModel.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: attendanceClockingAttendanceViewModel.networkFailure,
      );
    }
    // AttendanceClockingAttendanceDetailsModel? userClockingInfo =
    //     clockingInfoViewModel.clockingInfoDetails;
    AttendanceClockingAttendanceDetailsModel? userClockingInfo =
        getClockingInfo(attendanceClockingAttendanceViewModel);
    // clockingInfoDetails
    if (kDebugMode) {
      // print({"userClockingInfo": userClockingInfo});
    }
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
}
