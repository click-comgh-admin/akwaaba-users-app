// import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
// import 'package:akwaaba_user_app/models/attendance/meeting/datatable/main.dart';
// import 'package:akwaaba_user_app/models/attendance/meeting/tabbar/main.dart';
// import 'package:flutter/material.dart';

// abstract class AttendanceMeetingDataTableViewModel extends ChangeNotifier {
//   bool _loading = false;
//   NetworkFailure? _networkFailure;
//   AttendanceScheduleDatatableModel? _attendanceScheduleDatatable;
//   AttendanceMeetingTabBarModel? get tab;
//   String? get search;

//   bool get loading => _loading;
//   AttendanceScheduleDatatableModel? get attendanceScheduleDatatable => _attendanceScheduleDatatable;
//   NetworkFailure? get networkFailure => _networkFailure;
  

//   set setTab(AttendanceMeetingTabBarModel tab);
//   set setSearch(String search);

//   void clearSearch();

//   void setLoading(bool loading) async {
//     _loading = loading;
//     nF(); // called once here;
//   }

//   void nF() async {
//     notifyListeners();
//   }

//   Future<bool> getData(Map<String, dynamic> queryParameter, {DateTime? date});

//   setAttendanceScheduleDatatableModel(
//       AttendanceScheduleDatatableModel attendanceScheduleDatatable);
//   void setNetworkFailure();
// }
