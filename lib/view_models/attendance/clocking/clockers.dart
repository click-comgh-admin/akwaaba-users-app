import 'package:akwaaba_user_app/imports/classes/network/attendance/clocking/breaks.dart';
import 'package:akwaaba_user_app/imports/classes/network/attendance/clocking/clocker.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:flutter/foundation.dart';

// final AttendanceClockingAttendanceModelDatabase _connectionsUserModelDatabase =
//     AttendanceClockingAttendanceModelDatabase();

class AttendanceClockerClockingAttendanceViewModel extends ChangeNotifier {
  int _attendanceId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  AttendanceClockingAttendanceModel? _clockingInfo;
  List<AttendanceClockingAttendanceModel> _clockingInfos = [];
  AttendanceClockingAttendanceDetailsModel? _clockingInfoDetails;
  List<AttendanceClockingAttendanceDetailsModel> _clockingInfosDetails = [];

  bool get loading => _loading;
  int get attendanceId => _attendanceId;
  AttendanceClockingAttendanceModel? get clockingInfo => _clockingInfo;
  List<AttendanceClockingAttendanceModel> get clockingInfos => _clockingInfos;
  AttendanceClockingAttendanceDetailsModel? get clockingInfoDetails =>
      _clockingInfoDetails;
  List<AttendanceClockingAttendanceDetailsModel> get clockingInfosDetails =>
      _clockingInfosDetails;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceClockerClockingAttendanceViewModel({int? attendanceId}) {
    if (attendanceId == null) {
      // upcomingSchedules();
    }
  }

  factory AttendanceClockerClockingAttendanceViewModel.autoLoad(
          {int? attendanceId}) =>
      AttendanceClockerClockingAttendanceViewModel(
        attendanceId: attendanceId,
      );

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  setAttendanceId(int attendanceId) async {
    _attendanceId = attendanceId;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setClockingInfoModel(AttendanceClockingAttendanceModel clockingInfo) {
    _clockingInfo = clockingInfo;
    nF();
  }

  setClockingInfoListModel(
      List<AttendanceClockingAttendanceModel> clockingInfos) {
    if (kDebugMode) {
      // print({"clockingInfos.toString()": clockingInfos.toString()});
    }
    _clockingInfos = clockingInfos;
  }

  setClockingInfoDetailsModel(
      AttendanceClockingAttendanceDetailsModel clockingInfoDetails) {
    _clockingInfoDetails = clockingInfoDetails;
  }

  setClockingInfoListDetailsModel(
      List<AttendanceClockingAttendanceDetailsModel> clockingInfosDetails) {
    if (kDebugMode) {
      // print({"clockingInfos.toString()": clockingInfos.toString()});
    }
    _clockingInfosDetails = clockingInfosDetails;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    // print({"networkFailure.toString()": networkFailure.toString()});
    // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
    _clockingInfos = [];
    _networkFailure = networkFailure;
  }

  // ATTENDANCE //

  Future<bool> clockIn({int? clockingId}) async {
    setLoading(true);
    var clockingInfosSuccess = false;
    var response = await AttendanceClockerClockingAttendanceNetwork.clockIn(
        clockingId ?? attendanceId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setClockingInfoModel(
        response.response as AttendanceClockingAttendanceModel,
      );
      clockingInfosSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      clockingInfosSuccess = false;
    }
    setLoading(false);
    return clockingInfosSuccess;
  }

  Future<Object> clockInAlt({int? clockingId}) async =>
      await AttendanceClockerClockingAttendanceNetwork.clockIn(
          clockingId ?? attendanceId);

  Future<bool> clockOut({int? clockingId}) async {
    setLoading(true);
    var clockingInfosSuccess = false;
    var response = await AttendanceClockerClockingAttendanceNetwork.clockOut(
        clockingId ?? attendanceId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setClockingInfoModel(
        response.response as AttendanceClockingAttendanceModel,
      );
      clockingInfosSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      clockingInfosSuccess = false;
    }
    setLoading(false);
    return clockingInfosSuccess;
  }

  Future<Object> clockOutAlt({int? clockingId}) async =>
      await AttendanceClockerClockingAttendanceNetwork.clockOut(
          clockingId ?? attendanceId);

  // BREAK TIME //

  Future<bool> startBreak({int? clockingId}) async {
    setLoading(true);
    var clockingInfosSuccess = false;
    var response =
        await AttendanceBreakClockerClockingAttendanceNetwork.startBreak(
            clockingId ?? attendanceId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setClockingInfoModel(
        response.response as AttendanceClockingAttendanceModel,
      );
      clockingInfosSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      clockingInfosSuccess = false;
    }
    setLoading(false);
    return clockingInfosSuccess;
  }

  Future<Object> startBreakAlt({int? clockingId}) async =>
      await AttendanceBreakClockerClockingAttendanceNetwork.startBreak(
          clockingId ?? attendanceId);

  Future<bool> endBreak({int? clockingId}) async {
    setLoading(true);
    var clockingInfosSuccess = false;
    var response =
        await AttendanceBreakClockerClockingAttendanceNetwork.endBreak(
            clockingId ?? attendanceId);
    // print({"response":response});
    if (response is NetworkSuccess) {
      setClockingInfoModel(
        response.response as AttendanceClockingAttendanceModel,
      );
      clockingInfosSuccess = true;
    }
    if (response is NetworkFailure) {
      // print({"response.data": response.data});
      setNetworkFailure(response);
      clockingInfosSuccess = false;
    }
    setLoading(false);
    return clockingInfosSuccess;
  }

  Future<Object> endBreakAlt({int? clockingId}) async =>
      await AttendanceBreakClockerClockingAttendanceNetwork.endBreak(
          clockingId ?? attendanceId);
}
