import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/functions/device_info/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/padding_margin/home_clocker_card_list_tile/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/clockerfx.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/clockers.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/main.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreaksUiCardClockerAttendancePagesHomeWidget extends StatefulWidget {
  final AttendanceScheduleModel meeting;
  final AttendanceClockingAttendanceDetailsModel? clockingInfo;
  const BreaksUiCardClockerAttendancePagesHomeWidget(
      {Key? key, required this.meeting, required this.clockingInfo})
      : super(key: key);

  @override
  State<BreaksUiCardClockerAttendancePagesHomeWidget> createState() =>
      _BreaksUiCardClockerAttendancePagesHomeWidgetState();
}

class _BreaksUiCardClockerAttendancePagesHomeWidgetState
    extends State<BreaksUiCardClockerAttendancePagesHomeWidget> {
  ScrollController scrollController = ScrollController();
  GlobalKey<ArtDialogState> _artConfirmClockingDialogKey =
      GlobalKey<ArtDialogState>();

  String? startBreakTime;
  String? endBreakTime;
  AttendanceClockingAttendanceModel? clockingInfoModel;
  Map<String, dynamic>? deviceInfo;

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
    deviceInfoFunction().then((value) => deviceInfo = value);
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  bool setClockingInfoModelCalled = false;

  setClockingInfoModel(
    AttendanceClockerClockingAttendanceViewModel
        attendanceClockingAttendanceViewModel,
  ) {
    if (!setClockingInfoModelCalled) {
      setState(() {
        clockingInfoModel = AttendanceClockingAttendanceModel(
          accountType: widget.clockingInfo?.accountType,
          clockedBy: widget.clockingInfo?.clockedBy,
          clockingMethod: widget.clockingInfo?.clockingMethod,
          date: widget.clockingInfo?.date,
          endBreak: widget.clockingInfo?.endBreak,
          id: widget.clockingInfo?.id,
          inOrOut: widget.clockingInfo?.inOrOut,
          inTime: widget.clockingInfo?.inTime,
          meetingEventId: widget.clockingInfo?.meetingEventId?.id,
          memberId: widget.clockingInfo?.memberId.id,
          outTime: widget.clockingInfo?.outTime,
          startBreak: widget.clockingInfo?.startBreak,
          successResponseMessage: "??",
          validate: widget.clockingInfo?.validate,
        );
        setClockingInfoModelCalled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AttendanceScheduleLocationViewModel attendanceScheduleLocationViewModel =
        context.watch<AttendanceScheduleLocationViewModel>();
    AttendanceClockerClockingAttendanceViewModel
        attendanceClockingAttendanceViewModel =
        context.watch<AttendanceClockerClockingAttendanceViewModel>();
    ClockingDeviceViewModel clockingDeviceViewModel =
        context.watch<ClockingDeviceViewModel>();
    setClockingInfoModel(attendanceClockingAttendanceViewModel);

    if (clockingInfoModel != null) {
      startBreakTime = clockingInfoModel!.startBreak == null
          ? null
          : formatTimeDatetimeFunction(
              DateTime.parse("${clockingInfoModel!.startBreak!}"));

      endBreakTime = clockingInfoModel!.endBreak == null
          ? null
          : formatTimeDatetimeFunction(
              DateTime.parse("${clockingInfoModel!.endBreak!}"));
    }
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text(
            "Break Time Clocking",
            style: Theme.of(context).textTheme.headline6,
          ),
          startBreakWidget(
            attendanceScheduleLocationViewModel,
            attendanceClockingAttendanceViewModel,
            clockingDeviceViewModel,
          ),
          const Padding(
            padding: homeClockerCardListTile,
            child: Divider(),
          ),
          endBreakWidget(
            attendanceScheduleLocationViewModel,
            attendanceClockingAttendanceViewModel,
            clockingDeviceViewModel,
          ),
        ],
      ),
    );
  }

  ListTile startBreakWidget(
    AttendanceScheduleLocationViewModel aslViewModel,
    AttendanceClockerClockingAttendanceViewModel acaViewModel,
    ClockingDeviceViewModel cdViewModel,
  ) {
    return ListTile(
      contentPadding: homeClockerCardListTile,
      title: Text(
        "Start Now",
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                context,
              ),
            ),
      ),
      subtitle: (startBreakTime == null)
          ? Text(
              "not started yet",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontStyle: FontStyle.italic,
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            )
          : Text(
              "$startBreakTime",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
      trailing: IconButton(
        color: Colors.green,
        icon: const Icon(Icons.keyboard_double_arrow_right_sharp),
        onPressed: () => startBreakFx(aslViewModel, acaViewModel, cdViewModel),
      ),
    );
  }

  ListTile endBreakWidget(
    AttendanceScheduleLocationViewModel aslViewModel,
    AttendanceClockerClockingAttendanceViewModel acaViewModel,
    ClockingDeviceViewModel cdViewModel,
  ) {
    return ListTile(
      contentPadding: homeClockerCardListTile,
      title: Text(
        "End Now",
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                context,
              ),
            ),
      ),
      subtitle: (endBreakTime == null)
          ? Text(
              "not started yet",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontStyle: FontStyle.italic,
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            )
          : Text(
              "$endBreakTime",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
      trailing: IconButton(
        color: Colors.red,
        icon: const Icon(Icons.keyboard_double_arrow_left_sharp),
        onPressed: () => endBreakFx(aslViewModel, acaViewModel, cdViewModel),
      ),
    );
  }

  Future<bool> startBreakFx(
    AttendanceScheduleLocationViewModel aslViewModel,
    AttendanceClockerClockingAttendanceViewModel acaViewModel,
    ClockingDeviceViewModel cdViewModel,
  ) async {
    return await clockerWidgetClockButtonFx(context,
        meetingId: widget.meeting.id!,
        meetingLocation: widget.meeting.meetingLocation!,
        alertMessage: "Start Break",
        artConfirmClockingDialogKey: _artConfirmClockingDialogKey,
        attendanceScheduleLocationViewModel: aslViewModel,
        clockingDeviceViewModel: cdViewModel,
        deviceInfo: deviceInfo!, clocker: (allowedToClock) async {
      if (allowedToClock) {
        _artConfirmClockingDialogKey.currentState!.showLoader();
        var clocked = await acaViewModel.startBreakAlt(
          clockingId: widget.clockingInfo!.id,
        );
        // print({"clocked_clocked_clocked": clocked});
        if (_artConfirmClockingDialogKey.currentState != null) {
          _artConfirmClockingDialogKey.currentState!.hideLoader();
        }
        if (clocked is NetworkSuccess) {
          AttendanceClockingAttendanceModel acam =
              clocked.response as AttendanceClockingAttendanceModel;

          setState(() {
            clockingInfoModel = acam;
          });
          // ArtDialogResponse artSweetAlert =
          await ArtSweetAlert.show(
            barrierDismissible: true,
            context: context,
            artDialogArgs: ArtDialogArgs(
              showCancelBtn: false,
              confirmButtonText: "Close",
              confirmButtonColor: Colors.grey,
              type: ArtSweetAlertType.success,
              customColumns: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    acam.successResponseMessage!,
                  ),
                ),
              ],
              // onConfirm: () {
              //   _artConfirmClockingDialogKey.currentState!.closeDialog();
              // },
              // onDispose: () {
              //   _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
              // },
            ),
          );
          // if (artSweetAlert.isTapConfirmButton) {
          //   _artConfirmClockingDialogKey.currentState!.closeDialog();
          // }
        }
        if (clocked is NetworkFailure) {
          // ArtDialogResponse artSweetAlert =
          await ArtSweetAlert.show(
            barrierDismissible: true,
            context: context,
            artDialogArgs: ArtDialogArgs(
              showCancelBtn: false,
              confirmButtonText: "Close",
              confirmButtonColor: Colors.grey,
              type: ArtSweetAlertType.warning,
              customColumns: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  // child: Text(clocked.errorResponse.toString()),
                  child: NetworkErrorWidget(
                    networkFailure: clocked,
                    showData: true,
                  ),
                )
              ],
              // onConfirm: () {
              //   _artConfirmClockingDialogKey.currentState!.closeDialog();
              // },
              // onDispose: () {
              //   _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
              // },
            ),
          );
          // if (artSweetAlert.isTapConfirmButton) {
          //   _artConfirmClockingDialogKey.currentState!.closeDialog();
          // }
        }
      } else {
        // ArtDialogResponse artSweetAlert =
        await ArtSweetAlert.show(
          barrierDismissible: true,
          context: context,
          artDialogArgs: ArtDialogArgs(
            showCancelBtn: false,
            confirmButtonText: "Close",
            confirmButtonColor: Colors.grey,
            type: ArtSweetAlertType.warning,
            title: "Sorry, you have be blocked from clocking",
          ),
        );
        // if (artSweetAlert.isTapConfirmButton) {
        //   _artConfirmClockingDialogKey.currentState!.closeDialog();
        // }
      }
    }, onDispose: () {
      _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
    });
  }

  Future<bool> endBreakFx(
    AttendanceScheduleLocationViewModel aslViewModel,
    AttendanceClockerClockingAttendanceViewModel acaViewModel,
    ClockingDeviceViewModel cdViewModel,
  ) async {
    return await clockerWidgetClockButtonFx(context,
        meetingId: widget.meeting.id!,
        meetingLocation: widget.meeting.meetingLocation!,
        alertMessage: "End Break",
        artConfirmClockingDialogKey: _artConfirmClockingDialogKey,
        attendanceScheduleLocationViewModel: aslViewModel,
        clockingDeviceViewModel: cdViewModel,
        deviceInfo: deviceInfo!, clocker: (allowedToClock) async {
      if (allowedToClock) {
        _artConfirmClockingDialogKey.currentState!.showLoader();
        var clocked = await acaViewModel.endBreakAlt(
          clockingId: widget.clockingInfo!.id,
        );
        if (_artConfirmClockingDialogKey.currentState != null) {
          _artConfirmClockingDialogKey.currentState!.hideLoader();
        }
        if (clocked is NetworkSuccess) {
          AttendanceClockingAttendanceModel acam =
              clocked.response as AttendanceClockingAttendanceModel;

          setState(() {
            clockingInfoModel = acam;
          });
          // ArtDialogResponse artSweetAlert =
          await ArtSweetAlert.show(
            barrierDismissible: true,
            context: context,
            artDialogArgs: ArtDialogArgs(
              showCancelBtn: false,
              confirmButtonText: "Close",
              confirmButtonColor: Colors.grey,
              type: ArtSweetAlertType.success,
              customColumns: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    acam.successResponseMessage!,
                  ),
                ),
              ],
              // onConfirm: () {
              //   _artConfirmClockingDialogKey.currentState!.closeDialog();
              // },
              // onDispose: () {
              //   _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
              // },
            ),
          );
          // if (artSweetAlert.isTapConfirmButton) {
          //   _artConfirmClockingDialogKey.currentState!.closeDialog();
          // }
        }
        if (clocked is NetworkFailure) {
          // ArtDialogResponse artSweetAlert =
          await ArtSweetAlert.show(
            barrierDismissible: true,
            context: context,
            artDialogArgs: ArtDialogArgs(
              showCancelBtn: false,
              confirmButtonText: "Close",
              confirmButtonColor: Colors.grey,
              type: ArtSweetAlertType.warning,
              customColumns: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  // child: Text(clocked.errorResponse.toString()),
                  child: NetworkErrorWidget(
                    networkFailure: clocked,
                    showData: true,
                  ),
                )
              ],
              // onConfirm: () {
              //   _artConfirmClockingDialogKey.currentState!.closeDialog();
              // },
              // onDispose: () {
              //   _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
              // },
            ),
          );
          // if (artSweetAlert.isTapConfirmButton) {
          //   _artConfirmClockingDialogKey.currentState!.closeDialog();
          // }
        }
      } else {
        // ArtDialogResponse artSweetAlert =
        await ArtSweetAlert.show(
          barrierDismissible: true,
          context: context,
          artDialogArgs: ArtDialogArgs(
            showCancelBtn: false,
            confirmButtonText: "Close",
            confirmButtonColor: Colors.grey,
            type: ArtSweetAlertType.warning,
            title: "Sorry, you have be blocked from clocking",
          ),
        );
        // if (artSweetAlert.isTapConfirmButton) {
        //   _artConfirmClockingDialogKey.currentState!.closeDialog();
        // }
      }
    }, onDispose: () {
      _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
    });
  }
}
