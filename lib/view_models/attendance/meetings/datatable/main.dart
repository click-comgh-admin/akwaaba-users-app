import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/datatable/main.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/tabbar/main.dart';
import 'package:flutter/material.dart';

class AttendanceMeetingDataTableViewModel extends ChangeNotifier {
  bool _loading = false;
  NetworkFailure? _networkFailure;
  AttendanceScheduleDatatableModel? _attendanceScheduleDatatable;
  AttendanceMeetingTabBarModel? _tab;
  String? _search;
  String? _date;

  bool get loading => _loading;
  AttendanceScheduleDatatableModel? get attendanceScheduleDatatable =>
      _attendanceScheduleDatatable;
  NetworkFailure? get networkFailure => _networkFailure;
  AttendanceMeetingTabBarModel? get tab => _tab;
  String? get search => _search;
  String? get date => _date;

  set setTab(AttendanceMeetingTabBarModel tab) {
    _tab = tab;
    nF();
  }

  set setSearch(String search) {
    _search = search;
    nF();
  }

  set setDate(String date) {
    _date = date;
    nF();
  }

  set setAttendanceScheduleDatatableModel(
      AttendanceScheduleDatatableModel attendanceScheduleDatatable) {
    _attendanceScheduleDatatable = attendanceScheduleDatatable;
    _networkFailure = null;
  }

  set setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _attendanceScheduleDatatable = null;
    _networkFailure = networkFailure;
  }

  void clearSearch() {
    _search = "";
    nF();
  }

  void clearDate() {
    _date = "";
    nF();
  }

  void setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  void nF() async {
    notifyListeners();
  }

  Future<bool> getData(Map<String, dynamic> queryParameter, {DateTime? date}) async {
    throw "implement getData";
  }
}
