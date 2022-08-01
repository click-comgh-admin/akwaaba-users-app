import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/models/attendance/device/device_values/main.dart';
import 'package:akwaaba_user_app/imports/functions/geolocator/web/check_in_radius.dart';
import 'package:akwaaba_user_app/imports/functions/geolocator/web/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/location/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/main.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> clockerWidgetClockButtonFx(
  BuildContext context, {
  required int meetingId,
  required int meetingLocation,
  required String alertMessage,
  required GlobalKey<ArtDialogState> artConfirmClockingDialogKey,
  required AttendanceScheduleLocationViewModel
      attendanceScheduleLocationViewModel,
  required ClockingDeviceViewModel clockingDeviceViewModel,
  required Map<String, dynamic> deviceInfo,
  required void Function(bool) clocker,
  required Function onDispose,
}) async {
  bool allowedToClock = false;
  Color primaryColor = Theme.of(context).primaryColor;
  if (meetingLocation == 1) {
    await ArtSweetAlert.show(
      artDialogKey: artConfirmClockingDialogKey,
      context: context,
      artDialogArgs: ArtDialogArgs(
        title: alertMessage,
        showCancelBtn: true,
        confirmButtonText: "Yes",
        type: ArtSweetAlertType.question,
        confirmButtonColor: primaryColor,
        cancelButtonText: "Close",
        onConfirm: () async {
          artConfirmClockingDialogKey.currentState!.showLoader();
          var scheduleLocationAlt = await attendanceScheduleLocationViewModel
              .scheduleLocationAlt(meetingId: meetingId);
          artConfirmClockingDialogKey.currentState!.hideLoader();

          if (scheduleLocationAlt is NetworkSuccess) {
            if (scheduleLocationAlt.response != null) {
              AttendanceScheduleLocationModel meetingLocation =
                  scheduleLocationAlt.response
                      as AttendanceScheduleLocationModel;
              if (kDebugMode) {
                // print({"meetingLocation": meetingLocation});
              }
              // double meetingLatitude = 5.661721;
              // double meetingLongitude = -0.008692;
              // double meetingRadius = 2.0; // kilometers
              double? meetingLatitude =
                  double.tryParse(meetingLocation.latitude!);
              double? meetingLongitude =
                  double.tryParse(meetingLocation.longitude!);
              double? meetingRadius = meetingLocation.radius!; // kilometers

              artConfirmClockingDialogKey.currentState!.showLoader();
              var position = await geolocatorWebFunction();
              artConfirmClockingDialogKey.currentState!.hideLoader();
              if (kDebugMode) {
                // print({"position": position});
              }
              if (position == null) {
                await ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.danger,
                    showCancelBtn: false,
                    confirmButtonText: "Close",
                    confirmButtonColor: Colors.grey,
                    customColumns: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: const Text(
                          "Unexpected Error",
                        ),
                      )
                    ],
                  ),
                );
              }
              if (position is PositionUpdateException) {
                await ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.warning,
                    showCancelBtn: false,
                    confirmButtonText: "Close",
                    confirmButtonColor: Colors.grey,
                    customColumns: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: Text(position.message!),
                      )
                    ],
                  ),
                );
              }

              if (position is Position) {
                double positionLatitude = position.latitude;
                double positionLongitude = position.longitude;
                // double positionLatitude = 5.6615676;
                // double positionLongitude = -0.0086838;
                // double positionLatitude = 5.6740376;
                // double positionLongitude = -0.0248695;
                CheckInRadius checkInRadius = await geolocatorCheckInRadius(
                  startLatitude: positionLatitude,
                  startLongitude: positionLongitude,
                  endLatitude: meetingLatitude!,
                  endLongitude: meetingLongitude!,
                  radius: meetingRadius,
                );
                // bool checkInRadius = true;
                if (kDebugMode) {
                  // print({"checkInRadius": checkInRadius});
                }
                if (checkInRadius.inRadius) {
                  // allowedToClock = true;
                  // clocker(allowedToClock);

                  await _deviceCheck(
                    context,
                    artConfirmClockingDialogKey: artConfirmClockingDialogKey,
                    clockingDeviceViewModel: clockingDeviceViewModel,
                    deviceInfo: deviceInfo,
                    clocker: clocker,
                    allowedToClock: allowedToClock,
                    primaryColor: primaryColor,
                  );
                } else {
                  await ArtSweetAlert.show(
                    barrierDismissible: true,
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      showCancelBtn: false,
                      confirmButtonText: "Close",
                      confirmButtonColor: Colors.grey,
                      type: ArtSweetAlertType.warning,
                      title:
                          "You need to be about $meetingRadius Kilometers within premises, you're currently ${checkInRadius.short} Kilometers away",
                    ),
                  );
                }
              }
            } else {
              await ArtSweetAlert.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.warning,
                  showCancelBtn: false,
                  confirmButtonText: "Close",
                  confirmButtonColor: Colors.grey,
                  customColumns: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: const Text(
                        "Location info not found, contact your account administrator",
                      ),
                    )
                  ],
                ),
              );
            }
          }

          if (scheduleLocationAlt is NetworkFailure) {
            await ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                showCancelBtn: false,
                confirmButtonText: "Close",
                confirmButtonColor: Colors.grey,
                customColumns: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: Text(scheduleLocationAlt.errorResponse.toString()),
                  )
                ],
              ),
            );
          }

          artConfirmClockingDialogKey.currentState!.closeDialog();
        },
        onDispose: () {
          artConfirmClockingDialogKey = GlobalKey<ArtDialogState>();
        },
      ),
    );
  } else {
    await ArtSweetAlert.show(
      artDialogKey: artConfirmClockingDialogKey,
      context: context,
      artDialogArgs: ArtDialogArgs(
        title: alertMessage,
        showCancelBtn: true,
        confirmButtonText: "Yes", type: ArtSweetAlertType.question,
        confirmButtonColor: primaryColor,
        cancelButtonText: "Close",
        onConfirm: () async {
          await _deviceCheck(
            context,
            artConfirmClockingDialogKey: artConfirmClockingDialogKey,
            clockingDeviceViewModel: clockingDeviceViewModel,
            deviceInfo: deviceInfo,
            clocker: clocker,
            allowedToClock: allowedToClock,
            primaryColor: primaryColor,
          );

          artConfirmClockingDialogKey.currentState!.closeDialog();
        },
        // onDispose: onDispose,
      ),
    );
  }
  return allowedToClock;
}

Future<void> _deviceCheck(
  BuildContext context, {
  required GlobalKey<ArtDialogState> artConfirmClockingDialogKey,
  required ClockingDeviceViewModel clockingDeviceViewModel,
  required Map<String, dynamic> deviceInfo,
  required void Function(bool) clocker,
  required bool allowedToClock,
  required Color primaryColor,
}) async {
  artConfirmClockingDialogKey.currentState!.showLoader();
  var myDeviceAlt = await clockingDeviceViewModel.myDeviceAlt;
  artConfirmClockingDialogKey.currentState!.hideLoader();
  if (kDebugMode) {
    // print({"_deviceCheck-myDeviceAlt": myDeviceAlt});
  }

  if (myDeviceAlt is NetworkSuccess) {
    ClockingDeviceModel? clockingDevice = myDeviceAlt.response == null
        ? null
        : myDeviceAlt.response as ClockingDeviceModel;
    if (kDebugMode) {
      // print({"clockingDevice": clockingDevice});
    }

    var clockingDeviceInfo = ClockingDeviceValuesModel.deviceInfo(deviceInfo);
    String myDeviceId = clockingDevice!.deviceId!;
    String myDeviceType = clockingDevice.deviceType!;
    int? mySystemDevice = clockingDevice.systemDevice;

    String deviceId = clockingDeviceInfo.deviceId;
    String deviceType = clockingDeviceInfo.deviceType;
    int? systemDevice = int.tryParse(clockingDeviceInfo.systemDevice);

    if ((myDeviceId == deviceId) &
        (myDeviceType == deviceType) &
        (mySystemDevice == systemDevice)) {
      allowedToClock = true;
      clocker(allowedToClock);
    } else {
      List<String> errorInfo = [
        "This account is already assigned to a different device",
        "You cannot clock attendance with a different device until a period one month since last device assignment has elapsed",
        "Request new device assignment using the request button, or contact your system administrator.",
      ];
      await ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            showCancelBtn: true,
            confirmButtonText: "Request",
            confirmButtonColor: primaryColor,
            customColumns: errorInfo
                .map(
                  (e) => ListTile(
                    leading: const Icon(Icons.info_outlined),
                    title: Text(e),
                    subtitle: const Divider(),
                  ),
                )
                .toList(),
            onConfirm: () {
              AutoRouter.of(context).push(const DeviceSettingsRouteWeb());
            }),
      );
    }
  }

  if (myDeviceAlt is NetworkFailure) {
    await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.danger,
        showCancelBtn: false,
        confirmButtonText: "Close",
        confirmButtonColor: Colors.grey,
        customColumns: [
          Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text(myDeviceAlt.errorResponse.toString()),
          )
        ],
      ),
    );
  }
}
