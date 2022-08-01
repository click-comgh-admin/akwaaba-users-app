import 'dart:io';

import 'package:akwaaba_user_app/imports/functions/device_info/main.dart';
import 'package:akwaaba_user_app/imports/utilities/enums/device_system/main.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

Future<ClockingDeviceValuesModel> clockingDeviceLoginValuesFunction() async {
  Map<String, dynamic> deviceInfo = await deviceInfoFunction();
  // print({"deviceInfo-deviceInfo": deviceInfo});
  return ClockingDeviceValuesModel.deviceInfo(
    deviceInfo,
    checkDeviceInfo: "on",
  );
}

class ClockingDeviceValuesModel {
  final String systemDevice;
  final String deviceType;
  final String deviceId;
  final String? checkDeviceInfo;
  ClockingDeviceValuesModel({
    required this.deviceId,
    required this.deviceType,
    required this.systemDevice,
    this.checkDeviceInfo,
  });

  factory ClockingDeviceValuesModel.deviceInfo(Map<String, dynamic> deviceInfo,
          {String? checkDeviceInfo}) =>
      ClockingDeviceValuesModel(
        deviceId: _deviceId(deviceInfo),
        deviceType: _deviceType(deviceInfo),
        systemDevice: _systemDevice().toString(),
        checkDeviceInfo: checkDeviceInfo,
      );
}

String _deviceId(Map<String, dynamic> deviceInfo) {
  return deviceInfo['device id'];
}

String _deviceType(Map<String, dynamic> deviceInfo) {
  return deviceInfo['device type'];
}

int _systemDevice() {
  if (kIsWeb) {
    return ClockingDeviceSystem.pwa.index + 1;
  } else {
    if (Platform.isAndroid) {
      return ClockingDeviceSystem.android.index + 1;
    } else if (Platform.isIOS) {
      return ClockingDeviceSystem.ios.index + 1;
    } else if (Platform.isLinux) {
      return ClockingDeviceSystem.linux.index + 1;
    } else if (Platform.isMacOS) {
      return ClockingDeviceSystem.macOs.index + 1;
    } else if (Platform.isWindows) {
      return ClockingDeviceSystem.windows.index + 1;
    } else {
      return 0;
    }
  }
}
