import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/utilities/extentions/string/main.dart';

import 'package:akwaaba_user_app/imports/functions/device_info/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/height/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/device_values/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/full/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/request.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TopCardDevicePageSettingsWidget extends StatefulWidget {
  const TopCardDevicePageSettingsWidget({Key? key}) : super(key: key);

  @override
  State<TopCardDevicePageSettingsWidget> createState() =>
      _TopCardDevicePageSettingsWidgetState();
}

class _TopCardDevicePageSettingsWidgetState
    extends State<TopCardDevicePageSettingsWidget> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  bool loading = true;
  ScrollController scrollController = ScrollController();
  GlobalKey<ArtDialogState> artConfirmClockingDialogKey =
      GlobalKey<ArtDialogState>();

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
    deviceInfoFunction().then((value) {
      setState(() {
        _deviceData = value;
        loading = false;
      });
    });

    ClockingDeviceViewModel clockingDeviceViewModel =
        Provider.of(context, listen: false);
    ClockingDeviceRequestViewModel clockingDeviceRequestViewModel =
        Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      clockingDeviceViewModel.myDevice;
      clockingDeviceRequestViewModel.lastRequest;
    });
  }

  @override
  Widget build(BuildContext context) {
    ClockingDeviceViewModel clockingDeviceViewModel =
        context.watch<ClockingDeviceViewModel>();

    ClockingDeviceRequestViewModel clockingDeviceRequestViewModel =
        context.watch<ClockingDeviceRequestViewModel>();
    if (kDebugMode) {
      // print({"_deviceData": _deviceData});
    }
    if (loading) {
      return const Center(
        child: LoadingWidget1(),
      );
    } else {
      return Card(
        child: SizedBox(
          width: double.infinity,
          height: topCardHeightConstantsUtilities,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200.0,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        DataTable(
                          columns: [
                            const DataColumn(
                              label: Text(
                                'Device Info',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: _approvedSection(clockingDeviceViewModel,
                                  clockingDeviceRequestViewModel),
                            ),
                          ],
                          rows: _deviceData.keys.map(
                            (String property) {
                              return DataRow(
                                cells: [
                                  DataCell(SizedBox(
                                    width: 80,
                                    child: Text(
                                      property.capitalize(),
                                    ),
                                  )),
                                  DataCell(
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '${_deviceData[property]}',
                                            ),
                                          ),
                                          width25SizeboxConstantsUtilities,
                                          IconButton(
                                            onPressed: () async {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text('Coppied'),
                                                ),
                                              );
                                              await Clipboard.setData(
                                                ClipboardData(
                                                  text: _deviceData[property]
                                                      .toString(),
                                                ),
                                              );
                                            },
                                            icon: Icon(Icons.copy_sharp,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color),
                                          ),
                                          const SizedBox(width: 200),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: -5,
                right: -10,
                child: Icon(Icons.electric_moped),
              ),
            ],
          ),
        ),
      );
    }
  }

  _approvedSection(ClockingDeviceViewModel clockingDeviceViewModel,
      ClockingDeviceRequestViewModel clockingDeviceRequestViewModel) {
    if (clockingDeviceViewModel.loading) {
      return const LoadingWidget1();
    }

    if (clockingDeviceViewModel.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: clockingDeviceViewModel.networkFailure,
      );
    }
    ClockingDeviceModel? clockingDeviceModel = clockingDeviceViewModel.device;
    if (kDebugMode) {
      // print({"attendanceSchedules": attendanceSchedules});
    }

    String myDeviceId = clockingDeviceModel!.deviceId!;
    String myDeviceType = clockingDeviceModel.deviceType!;
    int? mySystemDevice = clockingDeviceModel.systemDevice;

    var clockingDeviceInfo = ClockingDeviceValuesModel.deviceInfo(_deviceData);
    String deviceId = clockingDeviceInfo.deviceId;
    String deviceType = clockingDeviceInfo.deviceType;
    int? systemDevice = int.tryParse(clockingDeviceInfo.systemDevice);
    if ((myDeviceId == deviceId) &
        (myDeviceType == deviceType) &
        (mySystemDevice == systemDevice)) {
      return Row(
        children: const [
          Icon(
            color: Colors.green,
            Icons.check_box_outlined,
          ),
          width25SizeboxConstantsUtilities,
          Text("Approved"),
        ],
      );
    } else {
      return pendingStatus(
        clockingDeviceRequestViewModel,
        deviceId,
        deviceType,
        systemDevice,
      );
    }
  }

  pendingStatus(
    ClockingDeviceRequestViewModel clockingDeviceRequestViewModel,
    String deviceId,
    String deviceType,
    int? systemDevice,
  ) {
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
                    .copyWith(color: Theme.of(context).cardColor);
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
                      var requestApproval =
                          await clockingDeviceRequestViewModel.requestApproval(
                        systemDevice: systemDevice!.toString(),
                        deviceType: deviceType,
                        deviceId: deviceId,
                      );
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
                                    style: textStyle),
                              )
                            ],
                          ),
                        );
                        clockingDeviceRequestViewModel.nF();
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
