// import 'package:akwaaba_user_app/imports/classes/network/attendance/clocking/main.dart';
// import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
// import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
// import 'package:flutter/foundation.dart';

// // final AttendanceClockingAttendanceModelDatabase _connectionsUserModelDatabase =
// //     AttendanceClockingAttendanceModelDatabase();

// class AttendanceClockingAttendanceHomeClockerViewModel extends ChangeNotifier {
//   int _scheduleId = 0;
//   bool _loading = false;
//   NetworkFailure? _networkFailure;
//   AttendanceClockingAttendanceModel? _clockingInfo;
//   List<AttendanceClockingAttendanceModel> _clockingInfos = [];

//   bool get loading => _loading;
//   int get scheduleId => _scheduleId;
//   AttendanceClockingAttendanceModel? get clockingInfo => _clockingInfo;
//   List<AttendanceClockingAttendanceModel> get clockingInfos => _clockingInfos;
//   NetworkFailure? get networkFailure => _networkFailure;

//   AttendanceClockingAttendanceHomeClockerViewModel({int? scheduleId}) {
//     if (scheduleId == null) {
//       // upcomingSchedules();
//     }
//   }

//   factory AttendanceClockingAttendanceHomeClockerViewModel.autoLoad({int? scheduleId}) =>
//       AttendanceClockingAttendanceHomeClockerViewModel(
//         scheduleId: scheduleId,
//       );

//   setLoading(bool loading) async {
//     _loading = loading;
//     nF(); // called once here;
//   }

//   setScheduleId(int scheduleId) async {
//     _scheduleId = scheduleId;
//     nF(); // called once here;
//   }

//   nF() async {
//     notifyListeners();
//   }

//   setAttendanceScheduleModel(AttendanceClockingAttendanceModel clockingInfo) {
//     _clockingInfo = clockingInfo;
//   }

//   setAttendanceScheduleListModel(
//       List<AttendanceClockingAttendanceModel> clockingInfos) {
//     if (kDebugMode) {
//       print({"clockingInfos.toString()": clockingInfos.toString()});
//     }
//     _clockingInfos = clockingInfos;
//   }

//   setNetworkFailure(NetworkFailure networkFailure) {
//     // print({"networkFailure.toString()": networkFailure.toString()});
//     // print({"_networkFailure": _networkFailure, "networkFailure": networkFailure});
//     _clockingInfos = [];
//     _networkFailure = networkFailure;
//   }

//   Future<bool> memberAttendance({int? meetingId}) async {
//     setLoading(true);
//     var clockingInfosSuccess = false;
//     var response = await AttendanceClockingAttendanceNetwork.memberAttendance(
//         meetingId ?? scheduleId);
//     print({"response": response});
//     if (response is NetworkSuccess) {
//       setAttendanceScheduleModel(
//         response.response as AttendanceClockingAttendanceModel,
//       );
//       clockingInfosSuccess = true;
//     }
//     if (response is NetworkFailure) {
//       // print({"response.data": response.data});
//       setNetworkFailure(response);
//       clockingInfosSuccess = false;
//     }
//     setLoading(false);
//     return clockingInfosSuccess;
//   }

//   Future<Object> memberAttendanceAlt() async =>
//       await AttendanceClockingAttendanceNetwork.memberAttendance(
//         scheduleId,
//       );

//   Future<bool> memberAttendanceId() async {
//     setLoading(true);
//     var clockingInfosSuccess = false;
//     var response = await AttendanceClockingAttendanceNetwork.memberAttendanceId(
//         scheduleId);
//     // print({"response":response});
//     if (response is NetworkSuccess) {
//       setAttendanceScheduleModel(
//         response.response as AttendanceClockingAttendanceModel,
//       );
//       clockingInfosSuccess = true;
//     }
//     if (response is NetworkFailure) {
//       // print({"response.data": response.data});
//       setNetworkFailure(response);
//       clockingInfosSuccess = false;
//     }
//     setLoading(false);
//     return clockingInfosSuccess;
//   }

//   Future<Object> memberAttendanceIdAlt() async =>
//       await AttendanceClockingAttendanceNetwork.memberAttendanceId(
//         scheduleId,
//       );
// }
