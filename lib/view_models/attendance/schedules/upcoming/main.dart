import 'package:akwaaba_user_app/imports/classes/network/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:flutter/foundation.dart';

// final AttendanceScheduleModelDatabase _connectionsUserModelDatabase =
//     AttendanceScheduleModelDatabase();

class AttendanceScheduleUpcomingViewModel extends ChangeNotifier {
  bool _loading = false;
  NetworkFailure? _networkFailure;
  List<AttendanceScheduleModel> _attendanceSchedule = [];

  bool get loading => _loading;
  List<AttendanceScheduleModel> get attendanceSchedule => _attendanceSchedule;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceScheduleUpcomingViewModel({bool directCall = false}) {
    if (directCall) upcomingSchedules();
  }

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setAttendanceScheduleListModel(
      List<AttendanceScheduleModel> attendanceSchedule) {
    // if (kDebugMode) {
    //   print({"attendanceSchedule.toString()": attendanceSchedule.toString()});
    // }
    _attendanceSchedule = attendanceSchedule;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _attendanceSchedule = [];
    _networkFailure = networkFailure;
  }

  Future<bool> upcomingSchedules() async {
    setLoading(true);
    var attendanceScheduleSuccess = false;
    var response = await AttendanceScheduleNetwork.attendanceSchedulesUpcoming(
        queryParameter: {"filter_recuring": "both"});
    // print({"response":response});
    if (response is NetworkSuccess) {
      setAttendanceScheduleListModel(
          response.response as List<AttendanceScheduleModel>);
      attendanceScheduleSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      attendanceScheduleSuccess = false;
    }
    setLoading(false);
    return attendanceScheduleSuccess;
  }
}
