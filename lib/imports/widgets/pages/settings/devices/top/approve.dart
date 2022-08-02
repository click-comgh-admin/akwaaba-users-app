import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/settings/devices/top/status.dart';
import 'package:akwaaba_user_app/models/attendance/device/device_values/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/request.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopCardApprovalDevicePageSettingsWidget extends StatelessWidget {
  final Map<String, dynamic> deviceData;
  final ClockingDeviceViewModel clockingDeviceViewModel;
  final ClockingDeviceRequestViewModel clockingDeviceRequestViewModel;
  final GlobalKey<ArtDialogState> artConfirmClockingDialogKey;
  const TopCardApprovalDevicePageSettingsWidget({
    Key? key,
    required this.clockingDeviceViewModel,
    required this.clockingDeviceRequestViewModel,
    required this.deviceData,
    required this.artConfirmClockingDialogKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    var clockingDeviceInfo = ClockingDeviceValuesModel.deviceInfo(deviceData);
    String deviceId = clockingDeviceInfo.deviceId;
    String deviceType = clockingDeviceInfo.deviceType;
    int? systemDevice = int.tryParse(clockingDeviceInfo.systemDevice);
    // print({"myDeviceId":myDeviceId, "deviceId": deviceId});
    // print({"myDeviceType":myDeviceType, "deviceType": deviceType});
    // print({"mySystemDevice":mySystemDevice, "systemDevice": systemDevice});
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
      return TopCardPendingDevicePageSettingsWidget(
        deviceId: deviceId,
        deviceType: deviceType,
        systemDevice: systemDevice,
        artConfirmClockingDialogKey: artConfirmClockingDialogKey,
        clockingDeviceRequestViewModel: clockingDeviceRequestViewModel,
      );
    }
  }
}
