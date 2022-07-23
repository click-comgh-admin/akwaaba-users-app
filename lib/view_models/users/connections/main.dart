import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/users/connections/main.dart';
import 'package:akwaaba_user_app/imports/database/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main_datatable.dart';
import 'package:flutter/foundation.dart';

final ConnectionsUserModelDatabase _connectionsUserModelDatabase =
    ConnectionsUserModelDatabase();

class UserConnectionsViewModel extends ChangeNotifier {
  bool _loading = false;
  NetworkFailure? _networkFailure;
  List<UserConnectionsModel> _userConnections = [];
  UserConnectionsDatatableModel? _userConnectionsDatatable;

  bool get loading => _loading;
  List<UserConnectionsModel> get userConnections => _userConnections;
  UserConnectionsDatatableModel? get userConnectionsDatatable => _userConnectionsDatatable;
  NetworkFailure? get networkFailure => _networkFailure;

  UserConnectionsViewModel() {
    myConnections();
  }

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setUserConnectionsListModel(List<UserConnectionsModel> userConnections) {
    // if (kDebugMode) {
    //   print({"userConnections.toString()": userConnections.toString()});
    // }
    _userConnections = userConnections;
  }

  setUserConnectionsDatatableModel(UserConnectionsDatatableModel userConnectionsDatatable) {
    _userConnectionsDatatable = userConnectionsDatatable;
    _networkFailure = null;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _userConnections = [];
    _userConnectionsDatatable = null;
    _networkFailure = networkFailure;
  }

  Future<bool> myConnections5() async {
    setLoading(true);
    var userConnectionsSuccess = false;
    var response = await UserConnectionsNetwork.myConnections(queryParameter: {"length": 5});
    if (response is NetworkSuccess) {
      setUserConnectionsListModel(
          response.response as List<UserConnectionsModel>);
      userConnectionsSuccess = true;
    }
    if (response is NetworkFailure) {
      setNetworkFailure(response);
      userConnectionsSuccess = false;
    }
    setLoading(false);
    return userConnectionsSuccess;
  }

  Future<bool> myConnections() async {
    setLoading(true);
    var userConnectionsSuccess = false;
    var response = await UserConnectionsNetwork.myConnections();
    // print({"response":response});
    if (response is NetworkSuccess) {
      setUserConnectionsListModel(
          response.response as List<UserConnectionsModel>);
      userConnectionsSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      userConnectionsSuccess = false;
    }
    setLoading(false);
    return userConnectionsSuccess;
  }

  Future<bool> myConnectionsDatatable(Map<String, dynamic> queryParameter) async {
    var userConnectionsSuccess = false;
    var response = await UserConnectionsNetwork.myConnectionsDatatable(queryParameter);
    
    if (response is NetworkSuccess) {
      setUserConnectionsDatatableModel(
          response.response as UserConnectionsDatatableModel);
      userConnectionsSuccess = true;
    }
    if (response is NetworkFailure) {
      setNetworkFailure(response);
      userConnectionsSuccess = false;
    }
    return userConnectionsSuccess;
  }

  Future<bool> myConnectors() async {
    // setLoading(true);
    var userConnectionsSuccess = false;
    var response = await UserConnectionsNetwork.myConnectors();
    if (response is NetworkSuccess) {
      setUserConnectionsListModel(
          response.response as List<UserConnectionsModel>);
      userConnectionsSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      userConnectionsSuccess = false;
    }
    // setLoading(false);
    return userConnectionsSuccess;
  }

  set addConnection(UserConnectionsModel connection) {
    _connectionsUserModelDatabase.addConnection(connection);
  }

  updateConnection(int connectionId, UserConnectionsModel connection) {
    _connectionsUserModelDatabase.addConnection(connection);
  }

  Future<List<UserConnectionsModel?>> get getConnections async =>
      await _connectionsUserModelDatabase.getConnections();
}
