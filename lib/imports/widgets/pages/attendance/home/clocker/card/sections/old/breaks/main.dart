import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/functions/device_info/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/card/sections/clockerfx.dart';
import 'package:akwaaba_user_app/imports/widgets/text_button/main.dart';
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
  String alertMessage = "-";

  String startBreakTime = "__:__ __";
  String endBreakTime = "__:__ __";
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
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        attendanceClockingAttendanceViewModel.setClockingInfoModel(
          AttendanceClockingAttendanceModel(
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
          ),
        );
      });
      setState(() {
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

    if (attendanceClockingAttendanceViewModel.clockingInfo != null) {
      startBreakTime = attendanceClockingAttendanceViewModel
                  .clockingInfo!.startBreak ==
              null
          ? "__:__ __"
          : formatTimeDatetimeFunction(DateTime.parse(
              "${attendanceClockingAttendanceViewModel.clockingInfo!.startBreak!}"));

      endBreakTime = attendanceClockingAttendanceViewModel
                  .clockingInfo!.endBreak ==
              null
          ? "__:__ __"
          : formatTimeDatetimeFunction(DateTime.parse(
              "${attendanceClockingAttendanceViewModel.clockingInfo!.endBreak!}"));
    }
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const Divider(),
          Center(
            child: Text(
              "Break Time Clocking",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: SizedBox(
              width: 82,
              child: TextButtonIconWidget(
                onPressed: () async {
                  setState(() {
                    alertMessage = "Start Break";
                  });
                  await clockerWidgetClockButtonFx(context,
                      meetingId: widget.meeting.id!,
                      meetingLocation: widget.meeting.meetingLocation!,
                      alertMessage: alertMessage,
                      artConfirmClockingDialogKey: _artConfirmClockingDialogKey,
                      attendanceScheduleLocationViewModel:
                          attendanceScheduleLocationViewModel,
                      clockingDeviceViewModel: clockingDeviceViewModel,
                      deviceInfo: deviceInfo!, clocker: (allowedToClock) async {
                    if (allowedToClock) {
                      _artConfirmClockingDialogKey.currentState!.showLoader();
                      var clocked = await attendanceClockingAttendanceViewModel
                          .startBreakAlt(
                        clockingId: widget.clockingInfo!.id,
                      );
                      _artConfirmClockingDialogKey.currentState!.hideLoader();
                      if (clocked is NetworkSuccess) {
                        AttendanceClockingAttendanceModel acam = clocked
                            .response as AttendanceClockingAttendanceModel;

                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          attendanceClockingAttendanceViewModel
                              .setClockingInfoModel(acam);
                        });
                        ArtDialogResponse artSweetAlert =
                            await ArtSweetAlert.show(
                          barrierDismissible: false,
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
                            onConfirm: () {
                              _artConfirmClockingDialogKey.currentState!
                                  .closeDialog();
                            },
                            onDispose: () {
                              _artConfirmClockingDialogKey =
                                  GlobalKey<ArtDialogState>();
                            },
                          ),
                        );
                        if (artSweetAlert.isTapConfirmButton) {
                          _artConfirmClockingDialogKey.currentState!
                              .closeDialog();
                        }
                      }
                      if (clocked is NetworkFailure) {
                        ArtDialogResponse artSweetAlert =
                            await ArtSweetAlert.show(
                          barrierDismissible: false,
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            showCancelBtn: false,
                            confirmButtonText: "Close",
                            confirmButtonColor: Colors.grey,
                            type: ArtSweetAlertType.warning,
                            customColumns: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 12.0),
                                child: NetworkErrorWidget(
                                  networkFailure: clocked,
                                  showData: true,
                                ),
                              )
                            ],
                            onConfirm: () {
                              _artConfirmClockingDialogKey.currentState!
                                  .closeDialog();
                            },
                            onDispose: () {
                              _artConfirmClockingDialogKey =
                                  GlobalKey<ArtDialogState>();
                            },
                          ),
                        );
                        if (artSweetAlert.isTapConfirmButton) {
                          _artConfirmClockingDialogKey.currentState!
                              .closeDialog();
                        }
                      }
                    } else {
                      ArtDialogResponse artSweetAlert =
                          await ArtSweetAlert.show(
                        barrierDismissible: false,
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          showCancelBtn: false,
                          confirmButtonText: "Close",
                          confirmButtonColor: Colors.grey,
                          type: ArtSweetAlertType.warning,
                          title: "Sorry, you have be blocked from clocking",
                        ),
                      );
                      if (artSweetAlert.isTapConfirmButton) {
                        _artConfirmClockingDialogKey.currentState!
                            .closeDialog();
                      }
                    }
                  }, onDispose: () {
                    _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
                  });
                },
                label: "Start",
                color: Colors.green,
                icon: Icons.keyboard_double_arrow_right_sharp,
              ),
            ),
            trailing: SizedBox(
              width: 82,
              child: TextButtonIconWidget(
                onPressed: () async {
                  setState(() {
                    alertMessage = "End Break";
                  });
                  await clockerWidgetClockButtonFx(context,
                      meetingId: widget.meeting.id!,
                      meetingLocation: widget.meeting.meetingLocation!,
                      alertMessage: alertMessage,
                      artConfirmClockingDialogKey: _artConfirmClockingDialogKey,
                      attendanceScheduleLocationViewModel:
                          attendanceScheduleLocationViewModel,
                      clockingDeviceViewModel: clockingDeviceViewModel,
                      deviceInfo: deviceInfo!, clocker: (allowedToClock) async {
                    if (allowedToClock) {
                      _artConfirmClockingDialogKey.currentState!.showLoader();
                      var clocked = await attendanceClockingAttendanceViewModel
                          .endBreakAlt(
                        clockingId: widget.clockingInfo!.id,
                      );
                      _artConfirmClockingDialogKey.currentState!.hideLoader();
                      if (clocked is NetworkSuccess) {
                        AttendanceClockingAttendanceModel acam = clocked
                            .response as AttendanceClockingAttendanceModel;

                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          attendanceClockingAttendanceViewModel
                              .setClockingInfoModel(acam);
                        });
                        ArtDialogResponse artSweetAlert =
                            await ArtSweetAlert.show(
                          barrierDismissible: false,
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
                            onConfirm: () {
                              _artConfirmClockingDialogKey.currentState!
                                  .closeDialog();
                            },
                            onDispose: () {
                              _artConfirmClockingDialogKey =
                                  GlobalKey<ArtDialogState>();
                            },
                          ),
                        );
                        if (artSweetAlert.isTapConfirmButton) {
                          _artConfirmClockingDialogKey.currentState!
                              .closeDialog();
                        }
                      }
                      if (clocked is NetworkFailure) {
                        ArtDialogResponse artSweetAlert =
                            await ArtSweetAlert.show(
                          barrierDismissible: false,
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            showCancelBtn: false,
                            confirmButtonText: "Close",
                            confirmButtonColor: Colors.grey,
                            type: ArtSweetAlertType.warning,
                            customColumns: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 12.0),
                                child: NetworkErrorWidget(
                                  networkFailure: clocked,
                                  showData: true,
                                ),
                              )
                            ],
                            onConfirm: () {
                              _artConfirmClockingDialogKey.currentState!
                                  .closeDialog();
                            },
                            onDispose: () {
                              _artConfirmClockingDialogKey =
                                  GlobalKey<ArtDialogState>();
                            },
                          ),
                        );
                        if (artSweetAlert.isTapConfirmButton) {
                          _artConfirmClockingDialogKey.currentState!
                              .closeDialog();
                        }
                      }
                    } else {
                      ArtDialogResponse artSweetAlert =
                          await ArtSweetAlert.show(
                        barrierDismissible: false,
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          showCancelBtn: false,
                          confirmButtonText: "Close",
                          confirmButtonColor: Colors.grey,
                          type: ArtSweetAlertType.warning,
                          title: "Sorry, you have be blocked from clocking",
                        ),
                      );
                      if (artSweetAlert.isTapConfirmButton) {
                        _artConfirmClockingDialogKey.currentState!
                            .closeDialog();
                      }
                    }
                  }, onDispose: () {
                    _artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
                  });
                },
                color: Colors.red,
                label: "End",
                icon: Icons.keyboard_double_arrow_left_sharp,
              ),
            ),
            title: Text(
              "Start Time: $startBreakTime",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
            subtitle: Text(
              "End Time: $endBreakTime",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
