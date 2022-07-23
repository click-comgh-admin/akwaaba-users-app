import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/functions/geolocator/web/check_in_radius.dart';
import 'package:akwaaba_user_app/imports/functions/geolocator/web/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/location/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/main.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
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
      required void Function(bool) clocker,
      required Function onDispose,
}) async {
  bool allowedToClock = false;
  if (meetingLocation == 1) {
    await ArtSweetAlert.show(
      artDialogKey: artConfirmClockingDialogKey,
      context: context,
      artDialogArgs: ArtDialogArgs(
        title: alertMessage,
        showCancelBtn: true,
        confirmButtonText: "Yes",
        confirmButtonColor: Theme.of(context).primaryColor,
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
                print({"meetingLocation": meetingLocation});
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
                print({"position": position});
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
                bool checkInRadius = await geolocatorCheckInRadius(
                  startLatitude: positionLatitude,
                  startLongitude: positionLongitude,
                  endLatitude: meetingLatitude!,
                  endLongitude: meetingLongitude!,
                  radius: meetingRadius,
                );
                // bool checkInRadius = true;
                if (kDebugMode) {
                  print({"checkInRadius": checkInRadius});
                }
                if (checkInRadius) {
                  allowedToClock = true;
                  clocker(allowedToClock);
                } else {
                  await ArtSweetAlert.show(
                    barrierDismissible: false,
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      showCancelBtn: false,
                      confirmButtonText: "Close",
                      confirmButtonColor: Colors.grey,
                      type: ArtSweetAlertType.warning,
                      title:
                          "You need to be about $meetingRadius Kilometers within premises",
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
        confirmButtonText: "Yes",
        confirmButtonColor: Theme.of(context).primaryColor,
        cancelButtonText: "Close",
        onConfirm: () async {
          allowedToClock = true;
          clocker(allowedToClock);
        },
        onDispose: onDispose,
      ),
    );
  }
  return allowedToClock;
}
