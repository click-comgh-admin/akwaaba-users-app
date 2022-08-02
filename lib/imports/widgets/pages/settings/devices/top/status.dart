import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/full/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/request.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TopCardPendingDevicePageSettingsWidget extends StatelessWidget {
  final ClockingDeviceRequestViewModel clockingDeviceRequestViewModel;
  final String deviceId;
  final String deviceType;
  final int? systemDevice;
  final GlobalKey<ArtDialogState> artConfirmClockingDialogKey;
  const TopCardPendingDevicePageSettingsWidget(
      {Key? key,
      required this.clockingDeviceRequestViewModel,
      required this.deviceId,
      required this.deviceType,
      this.systemDevice,
      required this.artConfirmClockingDialogKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (clockingDeviceRequestViewModel.loading) {
      return const LoadingWidget1();
    }

    if (clockingDeviceRequestViewModel.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: clockingDeviceRequestViewModel.networkFailure,
      );
    }
    ClockingDeviceRequestFullModel? clockingDeviceRequestModel =
        clockingDeviceRequestViewModel.requestFull;
    if (kDebugMode) {
      // print({"clockingDeviceRequestModel": clockingDeviceRequestModel});
    }

    bool showPending = false;
    if (clockingDeviceRequestModel != null) {
      if (clockingDeviceRequestModel.approved == false) {
        showPending = true;
      }
    }
    // print({"showPending": showPending});

    if (showPending) {
      return Row(
        children: [
          Icon(
            color: Theme.of(context).primaryColor,
            Icons.access_time,
          ),
          width10SizeboxConstantsUtilities,
          const Text("Approval Pending"),
          width25SizeboxConstantsUtilities,
        ],
      );
    } else {
      return ResponsiveRowColumn(
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        rowMainAxisAlignment: MainAxisAlignment.center,
        // rowPadding: const EdgeInsets.all(30),
        // columnPadding: const EdgeInsets.all(30),
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Row(
              children: const [
                Icon(
                  color: Colors.red,
                  Icons.indeterminate_check_box_outlined,
                ),
                width10SizeboxConstantsUtilities,
                Text("Unapproved"),
                width25SizeboxConstantsUtilities,
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: TextButton.icon(
              onPressed: () async {
                TextStyle textStyle = Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(
                      color: Colors.green,
                      fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                        context,
                      ),
                    );
                await ArtSweetAlert.show(
                  artDialogKey: artConfirmClockingDialogKey,
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    title: "Request Clocking Device Approval",
                    showCancelBtn: true,
                    confirmButtonText: "Yes",
                    type: ArtSweetAlertType.question,
                    confirmButtonColor: Theme.of(context).primaryColor,
                    cancelButtonText: "Close",
                    onConfirm: () async {
                      StackRouter autoRouter = AutoRouter.of(context);
                      artConfirmClockingDialogKey.currentState!.showLoader();
                      var requestApproval =
                          await clockingDeviceRequestViewModel.requestApproval(
                        systemDevice: systemDevice!.toString(),
                        deviceType: deviceType,
                        deviceId: deviceId,
                      );
                      if (artConfirmClockingDialogKey.currentState != null) {
                        artConfirmClockingDialogKey.currentState!.hideLoader();
                      }
                      if (requestApproval) {
                        await ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            showCancelBtn: false,
                            confirmButtonText: "Close",
                            confirmButtonColor: Colors.grey,
                            customColumns: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  clockingDeviceRequestViewModel
                                      .request!.successResponseMessage!,
                                  style: textStyle,
                                ),
                              )
                            ],
                          ),
                        );
                        autoRouter.push(const DeviceSettingsRouteWeb());
                      } else {
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
                                child: NetworkErrorWidget(
                                  networkFailure: clockingDeviceRequestViewModel
                                      .networkFailure,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      artConfirmClockingDialogKey.currentState!.closeDialog();
                    },
                    // onDispose: onDispose,
                  ),
                );
              },
              icon: const Icon(Icons.important_devices_sharp),
              label: const Text("Request Approval"),
            ),
          ),
        ],
      );
    }
  }
}
