import 'package:akwaaba_user_app/imports/classes/network/attendance/misc/location.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/location/main.dart';
import 'package:flutter/foundation.dart';

// final AttendanceScheduleLocationModelDatabase _connectionsUserModelDatabase =
//     AttendanceScheduleLocationModelDatabase();

class AttendanceScheduleLocationViewModel extends ChangeNotifier {
  int _scheduleId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  AttendanceScheduleLocationModel? _attendanceScheduleLocation;

  bool get loading => _loading;
  int get scheduleId => _scheduleId;
  AttendanceScheduleLocationModel? get attendanceScheduleLocation =>
      _attendanceScheduleLocation;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceScheduleLocationViewModel() {
    if (_scheduleId != 0) {
      scheduleLocation();
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
      AttendanceScheduleLocationModel attendanceScheduleLocation) {
    if (kDebugMode) {
      // print({
      //   "attendanceScheduleLocation.toString()":
      //       attendanceScheduleLocation.toString()
      // });
    }
    _attendanceScheduleLocation = attendanceScheduleLocation;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    _attendanceScheduleLocation = null;
    _networkFailure = networkFailure;
  }

  Future<bool> scheduleLocation({int? meetingId}) async {
    setLoading(true);
    var attendanceScheduleLocationSuccess = false;
    var response = await AttendanceScheduleLocationNetwork.meetingLocation(
        meetingId ?? scheduleId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setAttendanceScheduleListModel(
          response.response as AttendanceScheduleLocationModel);
      attendanceScheduleLocationSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      attendanceScheduleLocationSuccess = false;
    }
    setLoading(false);
    return attendanceScheduleLocationSuccess;
  }

  Future<Object> scheduleLocationAlt({int? meetingId}) async {
    return await AttendanceScheduleLocationNetwork.meetingLocation(
        meetingId ?? scheduleId);
  }
}
