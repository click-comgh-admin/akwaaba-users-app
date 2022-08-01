import 'package:akwaaba_user_app/imports/classes/network/attendance/device/main.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/full/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/main.dart';
import 'package:flutter/foundation.dart';

// final ClockingDeviceModelDatabase _connectionsUserModelDatabase =
//     ClockingDeviceModelDatabase();

class ClockingDeviceRequestViewModel extends ChangeNotifier {
  bool _loading = false;
  NetworkFailure? _networkFailure;
  ClockingDeviceRequestFullModel? _requestFull;
  ClockingDeviceRequestModel? _request;

  bool get loading => _loading;
  ClockingDeviceRequestFullModel? get requestFull => _requestFull;
  ClockingDeviceRequestModel? get request => _request;
  NetworkFailure? get networkFailure => _networkFailure;

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setNetworkDeviceRequestGetResponse(
      ClockingDeviceRequestFullModel requestFull) {
    // if (kDebugMode) {
    //   print({"device.toString()": device.toString()});
    // }
    _requestFull = requestFull;
    _networkFailure = null;
  }

  setNetworkDeviceRequestPostResponse(ClockingDeviceRequestModel request) {
    _request = request;
    _networkFailure = null;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _request = null;
    _requestFull = null;
    _networkFailure = networkFailure;
  }

  Future<bool> get lastRequest async {
    setLoading(true);
    _networkFailure = null;
    var devicesSuccess = false;
    var response = await ClockingDeviceNetwork.lastRequest();
    // print({"response":response});
    if (response is NetworkSuccess) {
      if (response.response != null) {
        setNetworkDeviceRequestGetResponse(
            response.response as ClockingDeviceRequestFullModel);
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

  Future<Object> get lastRequestAlt async =>
      await ClockingDeviceNetwork.lastRequest();

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
      setNetworkDeviceRequestPostResponse(
          response.response as ClockingDeviceRequestModel);
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
