import 'dart:convert';
import 'dart:io';
// import 'dart:typed_data';

// import 'package:akwaaba_user_app/firebase_options.dart';
import 'package:akwaaba_user_app/view_models/firebase/current_token/main.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:universal_io/io.dart';

Future<Map<String, dynamic>> deviceInfoFunction() async {
  var deviceData = <String, dynamic>{};
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (kIsWeb) {
      // var windowsInfo = await deviceInfoPlugin.windowsInfo;
      // print({"await deviceInfoPlugin.windowsInfo": windowsInfo});
      // deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      deviceData = await _readWebBrowserInfoFBM();
    } else {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      } else if (Platform.isLinux) {
        deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
      } else if (Platform.isMacOS) {
        deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
      } else if (Platform.isWindows) {
        deviceData = _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
      }
    }
  } on PlatformException {
    deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
  }

  return deviceData;
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'device id': build.androidId,
    'device type': "${build.manufacturer} - ${build.model}",
    // 'version.securityPatch': build.version.securityPatch,
    // 'version.sdkInt': build.version.sdkInt,
    // 'version.release': build.version.release,
    // 'version.previewSdkInt': build.version.previewSdkInt,
    // 'version.incremental': build.version.incremental,
    // 'version.codename': build.version.codename,
    // 'version.baseOS': build.version.baseOS,
    // 'board': build.board,
    // 'bootloader': build.bootloader,
    // 'brand': build.brand,
    // 'device': build.device,
    // 'display': build.display,
    // 'fingerprint': build.fingerprint,
    // 'hardware': build.hardware,
    // 'host': build.host,
    // 'id': build.id,
    // 'manufacturer': build.manufacturer,
    // 'model': build.model,
    // 'product': build.product,
    // 'supported32BitAbis': build.supported32BitAbis,
    // 'supported64BitAbis': build.supported64BitAbis,
    // 'supportedAbis': build.supportedAbis,
    // 'tags': build.tags,
    // 'type': build.type,
    // 'isPhysicalDevice': build.isPhysicalDevice,
    // 'androidId': build.androidId,
    // 'systemFeatures': build.systemFeatures,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'device id': data.identifierForVendor,
    'device type':
        "${data.systemName}_${data.systemVersion} - ${data.name}_${data.model}",
    // 'name': data.name,
    // 'systemName': data.systemName,
    // 'systemVersion': data.systemVersion,
    // 'model': data.model,
    // 'localizedModel': data.localizedModel,
    // 'identifierForVendor': data.identifierForVendor,
    // 'isPhysicalDevice': data.isPhysicalDevice,
    // 'utsname.sysname:': data.utsname.sysname,
    // 'utsname.nodename:': data.utsname.nodename,
    // 'utsname.release:': data.utsname.release,
    // 'utsname.version:': data.utsname.version,
    // 'utsname.machine:': data.utsname.machine,
  };
}

Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
  return <String, dynamic>{
    'device id': data.machineId,
    'device type': "${data.name}_${data.version} - ${data.buildId}",
    // 'name': data.name,
    // 'version': data.version,
    // 'id': data.id,
    // 'idLike': data.idLike,
    // 'versionCodename': data.versionCodename,
    // 'versionId': data.versionId,
    // 'prettyName': data.prettyName,
    // 'buildId': data.buildId,
    // 'variant': data.variant,
    // 'variantId': data.variantId,
    // 'machineId': data.machineId,
  };
}

// ignore: unused_element
Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  var bytes =
      utf8.encode("${describeEnum(data.browserName)}${data.deviceMemory}");

  return <String, dynamic>{
    'device id': base64.encode(bytes),
    'device type': describeEnum(data.browserName),
    // 'browserName': describeEnum(data.browserName),
    // 'appCodeName': data.appCodeName,
    // 'appName': data.appName,
    // 'appVersion': data.appVersion,
    // 'deviceMemory': data.deviceMemory,
    // 'language': data.language,
    // 'languages': data.languages,
    // 'platform': data.platform,
    // 'product': data.product,
    // 'productSub': data.productSub,
    // 'userAgent': data.userAgent,
    // 'vendor': data.vendor,
    // 'vendorSub': data.vendorSub,
    // 'hardwareConcurrency': data.hardwareConcurrency,
    // 'maxTouchPoints': data.maxTouchPoints,
  };
}

Future<Map<String, dynamic>> _readWebBrowserInfoFBM() async {
  UserTokenViewModel tokenViewModel = UserTokenViewModel();

  String? token = await tokenViewModel.getToken;
  // print({"token-token_token-token": token});
  return <String, dynamic>{
    'device id': token,
    'device type': "Browser-PWA",
  };
}

Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  return <String, dynamic>{
    'computerName': data.computerName,
    'hostName': data.hostName,
    'arch': data.arch,
    'model': data.model,
    'kernelVersion': data.kernelVersion,
    'osRelease': data.osRelease,
    'activeCPUs': data.activeCPUs,
    'memorySize': data.memorySize,
    'cpuFrequency': data.cpuFrequency,
    'systemGUID': data.systemGUID,
  };
}

Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  return <String, dynamic>{
    'numberOfCores': data.numberOfCores,
    'computerName': data.computerName,
    'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
  };
}
