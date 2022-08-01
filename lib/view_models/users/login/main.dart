import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/users/login/main.dart';
import 'package:akwaaba_user_app/imports/database/models/users/connections/main.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/material.dart';

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();
final ConnectionsUserModelDatabase _connectionsUserModelDatabase =
    ConnectionsUserModelDatabase();

class UserLoginViewModel extends ChangeNotifier {
  bool _loading = false;
  bool _verified = false;
  NetworkFailure _networkFailure = NetworkFailure();
  UserLoginModel? _userLoginModel = UserLoginModel();
  int _memberId = 0;

  Future<bool> get isLoggedIn async {
    // getLogin!.then((value) async {
    //   print({"value-isLoggedIn": value});
    //   if (value == null) {
    //     return false;
    //   } else {
    //     await verifyLogin();
    //     return true;
    //   }
    // });

    UserLoginModel? login = await getLogin;
    // print({"value-isLoggedIn": login});
    if (login == null) {
      return false;
    } else {
      if (!_verified) {
        bool verifyLoginRes = await verifyLogin();
        return verifyLoginRes;
      }
      setMemberId = login.user!.id;
      return true;
    }
  }

  int get memberId => _memberId;

  set setMemberId(int memberId) {
    // print({"memberId": memberId});
    _memberId = memberId;
    // notifyListeners();
  }

  bool get loading => _loading;
  bool get verified => _verified;
  UserLoginModel get userLoginModel => _userLoginModel!;
  NetworkFailure get networkFailure => _networkFailure;

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setVerified(bool verified) async {
    _verified = verified;
  }

  setUserLoginListModel(UserLoginModel userLoginModel) {
    // print({"userLoginModel.toString()": userLoginModel.toString()});
    _userLoginModel = userLoginModel;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _networkFailure = networkFailure;
  }

  Future<bool> userLogin({
    required String emailPhone,
    required String password,
    required String checkDeviceInfo,
    required String systemDevice,
    required String deviceType,
    required String deviceId,
  }) async {
    setLoading(true);
    var userLoginSuccess = false;
    var response = await LoginNetwork.login(
      emailPhone: emailPhone,
      password: password,
      checkDeviceInfo: checkDeviceInfo,
      systemDevice: systemDevice,
      deviceType: deviceType,
      deviceId: deviceId,
    );
    if (response is NetworkSuccess) {
      setUserLoginListModel(response.response as UserLoginModel);
      userLoginSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      userLoginSuccess = false;
    }
    setLoading(false);
    return userLoginSuccess;
  }

  Future<bool> verifyLogin() async {
    // setLoading(true);
    var verificationSuccess = false;
    var response = await LoginNetwork.verifyLogin();
    if (response is NetworkSuccess) {
      setUserLoginListModel(response.response as UserLoginModel);
      verificationSuccess = true;
    }
    if (response is NetworkFailure) {
      setNetworkFailure(networkFailure);
      verificationSuccess = false;
    }
    setVerified(true);
    // setLoading(false);
    return verificationSuccess;
  }

  set login(UserLoginModel login) {
    _loginUserModelDatabase.setLogin(login);
  }

  Future<UserLoginModel?>? get getLogin async =>
      await _loginUserModelDatabase.getLogin();

  Future<void> logout() async {
    setLoading(true);
    await _loginUserModelDatabase.removeLogin(memberId);
    await _connectionsUserModelDatabase.removeConnections();
    setLoading(false);
  }
}
