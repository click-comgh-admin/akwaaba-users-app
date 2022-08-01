import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/breaks/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/clocking/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubUiCardAltClockerAttendancePagesHomeWidget extends StatelessWidget {
  final AttendanceScheduleModel meeting;
  final AttendanceClockingAttendanceViewModel clockingInfoViewModel;
  const SubUiCardAltClockerAttendancePagesHomeWidget({
    Key? key,
    required this.clockingInfoViewModel,
    required this.meeting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (clockingInfoViewModel.loading) {
      return const LoadingWidget1();
    }

    if (clockingInfoViewModel.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: clockingInfoViewModel.networkFailure,
      );
    }
    AttendanceClockingAttendanceDetailsModel? userClockingInfo =
        clockingInfoViewModel.clockingInfoDetails;
    if (kDebugMode) {
      // print({"userClockingInfo": userClockingInfo});
    }
    return Column(
      children: [
        ClockingUiCardClockerAttendancePagesHomeWidget(
          meeting: meeting,
          clockingInfo: userClockingInfo,
        ),
        BreaksUiCardClockerAttendancePagesHomeWidget(
          meeting: meeting,
          clockingInfo: userClockingInfo,
        ),
      ],
    );
  }
}
