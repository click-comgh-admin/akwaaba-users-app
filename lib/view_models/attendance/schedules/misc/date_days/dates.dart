import 'package:akwaaba_user_app/imports/classes/network/attendance/misc/days_dates.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/dates.dart';
import 'package:flutter/foundation.dart';

// final AttendanceScheduleDateModelDatabase _connectionsUserModelDatabase =
//     AttendanceScheduleDateModelDatabase();

class AttendanceScheduleDateViewModel extends ChangeNotifier {
  int _scheduleId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  List<AttendanceScheduleDateModel> _attendanceScheduleDates = [];

  bool get loading => _loading;
  int get scheduleId => _scheduleId;
  List<AttendanceScheduleDateModel> get attendanceScheduleDates =>
      _attendanceScheduleDates;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceScheduleDateViewModel({int scheduleId = 0}) {
    setScheduleId(scheduleId);
    scheduleDates();
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
      List<AttendanceScheduleDateModel> attendanceScheduleDates) {
    if (kDebugMode) {
      // print({
      //   "attendanceScheduleDates.toString()": attendanceScheduleDates.toString()
      // });
    }
    _attendanceScheduleDates = attendanceScheduleDates;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    _attendanceScheduleDates = [];
    _networkFailure = networkFailure;
  }

  Future<bool> scheduleDates() async {
    setLoading(true);
    var attendanceScheduleDatesSuccess = false;
    var response =
        await AttendanceScheduleDaysAndDatesNetwork.scheduleDates(scheduleId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setAttendanceScheduleListModel(
          response.response as List<AttendanceScheduleDateModel>);
      attendanceScheduleDatesSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      attendanceScheduleDatesSuccess = false;
    }
    setLoading(false);
    return attendanceScheduleDatesSuccess;
  }

  Future scheduleDatesAlt(int scheduleId) async {
    var response = await AttendanceScheduleDaysAndDatesNetwork.scheduleDates(
        scheduleId,
        queryParameter: {"ordering": "-date"});
    // print({"response":response});

    return response;
  }
}
