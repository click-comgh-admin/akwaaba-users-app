import 'package:akwaaba_user_app/imports/classes/network/attendance/misc/days_dates.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/days.dart';
import 'package:flutter/foundation.dart';

// final AttendanceScheduleDayModelDatabase _connectionsUserModelDatabase =
//     AttendanceScheduleDayModelDatabase();

class AttendanceScheduleDayViewModel extends ChangeNotifier {
  int _scheduleId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  List<AttendanceScheduleDayModel> _attendanceScheduleDays = [];

  bool get loading => _loading;
  int get scheduleId => _scheduleId;
  List<AttendanceScheduleDayModel> get attendanceScheduleDays =>
      _attendanceScheduleDays;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceScheduleDayViewModel() {
    if (_scheduleId != 0) {
      scheduleDays();
    }
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
      List<AttendanceScheduleDayModel> attendanceScheduleDays) {
    if (kDebugMode) {
      // print({
      //   "attendanceScheduleDays.toString()": attendanceScheduleDays.toString()
      // });
    }
    _attendanceScheduleDays = attendanceScheduleDays;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    _attendanceScheduleDays = [];
    _networkFailure = networkFailure;
  }

  Future<bool> scheduleDays() async {
    setLoading(true);
    var attendanceScheduleDaysSuccess = false;
    var response =
        await AttendanceScheduleDaysAndDatesNetwork.scheduleDays(scheduleId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setAttendanceScheduleListModel(
          response.response as List<AttendanceScheduleDayModel>);
      attendanceScheduleDaysSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      attendanceScheduleDaysSuccess = false;
    }
    setLoading(false);
    return attendanceScheduleDaysSuccess;
  }
}
