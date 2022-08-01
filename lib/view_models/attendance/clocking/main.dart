import 'package:akwaaba_user_app/imports/classes/network/attendance/clocking/main.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';

// final AttendanceClockingAttendanceModelDatabase _connectionsUserModelDatabase =
//     AttendanceClockingAttendanceModelDatabase();
final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class AttendanceClockingAttendanceViewModel extends ChangeNotifier {
  int _scheduleId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  AttendanceClockingAttendanceModel? _clockingInfo;
  List<AttendanceClockingAttendanceModel> _clockingInfos = [];
  AttendanceClockingAttendanceDetailsModel? _clockingInfoDetails;
  List<AttendanceClockingAttendanceDetailsModel> _clockingInfosDetails = [];

  bool get loading => _loading;
  int get scheduleId => _scheduleId;
  AttendanceClockingAttendanceModel? get clockingInfo => _clockingInfo;
  List<AttendanceClockingAttendanceModel> get clockingInfos => _clockingInfos;
  AttendanceClockingAttendanceDetailsModel? get clockingInfoDetails =>
      _clockingInfoDetails;
  List<AttendanceClockingAttendanceDetailsModel> get clockingInfosDetails =>
      _clockingInfosDetails;
  NetworkFailure? get networkFailure => _networkFailure;

  AttendanceClockingAttendanceViewModel({int? scheduleId}) {
    if (scheduleId == null) {
      // upcomingSchedules();
    }
  }

  factory AttendanceClockingAttendanceViewModel.autoLoad({int? scheduleId}) =>
      AttendanceClockingAttendanceViewModel(
        scheduleId: scheduleId,
      );

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

  setClockingInfoModel(AttendanceClockingAttendanceModel clockingInfo) {
    _clockingInfo = clockingInfo;
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

  Future<bool> memberAttendance(bool details, {int? meetingId}) async {
    UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
    setLoading(true);
    var clockingInfosSuccess = false;
    var response = await AttendanceClockingAttendanceNetwork.memberAttendance(
      meetingId ?? scheduleId,
      queryParameters: {"memberId": currentLogin!.memberId.toString()},
      // details: details,
    );
    // print({"response": response});
    if (response is NetworkSuccess) {
      if (details) {
        setClockingInfoDetailsModel(
          response.response as AttendanceClockingAttendanceDetailsModel,
        );
      } else {
        setClockingInfoModel(
          response.response as AttendanceClockingAttendanceModel,
        );
      }
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

  Future<Object> memberAttendanceAlt({int? meetingId}) async {
    UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
    return await AttendanceClockingAttendanceNetwork.memberAttendance(
        meetingId ?? scheduleId,
        queryParameters: {"memberId": currentLogin!.memberId.toString()});
  }

  Future<bool> memberAttendanceId() async {
    setLoading(true);
    var clockingInfosSuccess = false;
    var response = await AttendanceClockingAttendanceNetwork.memberAttendanceId(
        scheduleId);
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

  Future<Object> memberAttendanceIdAlt() async =>
      await AttendanceClockingAttendanceNetwork.memberAttendanceId(
        scheduleId,
      );
}
