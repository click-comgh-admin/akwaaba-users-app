import 'package:akwaaba_user_app/imports/classes/network/attendance/device/main.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/device/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/main.dart';
import 'package:flutter/foundation.dart';

// final ClockingDeviceModelDatabase _connectionsUserModelDatabase =
//     ClockingDeviceModelDatabase();

class ClockingDeviceViewModel extends ChangeNotifier {
  bool _loading = false;
  NetworkFailure? _networkFailure;
  List<ClockingDeviceModel> _devices = [];
  ClockingDeviceModel? _device;
  ClockingDeviceRequestModel? _request;

  bool get loading => _loading;
  List<ClockingDeviceModel> get devices => _devices;
  ClockingDeviceModel? get device => _device;
  ClockingDeviceRequestModel? get request => _request;
  NetworkFailure? get networkFailure => _networkFailure;

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setClockingDeviceListModel(List<ClockingDeviceModel> devices) {
    // if (kDebugMode) {
    //   print({"devices.toString()": devices.toString()});
    // }
    _devices = devices;
    _networkFailure = null;
  }

  setClockingDeviceModel(ClockingDeviceModel device) {
    // if (kDebugMode) {
    //   print({"device.toString()": device.toString()});
    // }
    _device = device;
    _networkFailure = null;
  }

  setUserLoginListModel(ClockingDeviceRequestModel request) {
    _request = request;
    _networkFailure = null;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _devices = [];
    _device = null;
    _networkFailure = networkFailure;
  }

  Future<bool> get myDevices async {
    setLoading(true);
    var devicesSuccess = false;
    var response = await ClockingDeviceNetwork.myDevices();
    // print({"response":response});
    if (response is NetworkSuccess) {
      setClockingDeviceListModel(
          response.response as List<ClockingDeviceModel>);
      devicesSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      devicesSuccess = false;
    }
    setLoading(false);
    return devicesSuccess;
  }

  Future<Object> get myDevicesAlt async =>
      await ClockingDeviceNetwork.myDevices();

  Future<bool> get myDevice async {
    setLoading(true);
    var devicesSuccess = false;
    var response = await ClockingDeviceNetwork.myDevices();
    // print({"response":response});
    if (response is NetworkSuccess) {
      var list = response.response as List<ClockingDeviceModel>;

      // list.sort((a, b) => a.id!.compareTo(b.id!));
      if (list.isNotEmpty) {
        setClockingDeviceModel(list[0]);
      }
      devicesSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      devicesSuccess = false;
    }
    setLoading(false);
    return devicesSuccess;
  }

  Future<Object> get myDeviceAlt async {
    var response = await ClockingDeviceNetwork.myDevices();
    if (response is NetworkSuccess) {
      var list = response.response as List<ClockingDeviceModel>;

      // list.sort((a, b) => a.id!.compareTo(b.id!));
      response = NetworkSuccess(
          code: response.code, response: list.isNotEmpty ? list[0] : null);
    }
    return response;
  }

  Future<bool> requestApproval({
    required String systemDevice,
    required String deviceType,
    required String deviceId,
  }) async {
    setLoading(true);
    var requestApprovalSuccess = false;
    var response = await ClockingDeviceNetwork.requestApproval(
      systemDevice: systemDevice,
      deviceType: deviceType,
      deviceId: deviceId,
    );
    if (response is NetworkSuccess) {
      setUserLoginListModel(response.response as ClockingDeviceRequestModel);
      requestApprovalSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      requestApprovalSuccess = false;
    }
    setLoading(false);
    return requestApprovalSuccess;
  }
}
