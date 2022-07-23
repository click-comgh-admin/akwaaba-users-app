import 'package:akwaaba_user_app/imports/classes/network/attendance/misc/break.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/break/main.dart';
import 'package:flutter/foundation.dart';

// final AttendanceScheduleBreakModelDatabase _connectionsUserModelDatabase =
//     AttendanceScheduleBreakModelDatabase();

class AttendanceScheduleBreakViewModel extends ChangeNotifier {
  int _scheduleId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  AttendanceScheduleBreakModel? _attendanceScheduleBreak;

  bool get loading => _loading;
  int get scheduleId => _scheduleId;
  AttendanceScheduleBreakModel? get attendanceScheduleBreak =>
      _attendanceScheduleBreak;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceScheduleBreakViewModel() {
    scheduleBreak();
  }

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  setScheduleId(int scheduleId) async {
    _scheduleId = scheduleId;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setAttendanceScheduleListModel(
      AttendanceScheduleBreakModel attendanceScheduleBreak) {
    if (kDebugMode) {
      // print({
      //   "attendanceScheduleBreak.toString()": attendanceScheduleBreak.toString()
      // });
    }
    _attendanceScheduleBreak = attendanceScheduleBreak;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    _attendanceScheduleBreak = null;
    _networkFailure = networkFailure;
  }

  Future<bool> scheduleBreak() async {
    setLoading(true);
    var attendanceScheduleBreakSuccess = false;
    var response =
        await AttendanceScheduleBreakNetwork.meetingBreak(scheduleId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setAttendanceScheduleListModel(
          response.response as AttendanceScheduleBreakModel);
      attendanceScheduleBreakSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      attendanceScheduleBreakSuccess = false;
    }
    setLoading(false);
    return attendanceScheduleBreakSuccess;
  }

  Future<Object> scheduleBreakAlt(int scheduleId) async {
    var response = await AttendanceScheduleBreakNetwork.meetingBreak(
      scheduleId,
    );
    // print({"response":response});

    return response;
  }
}
