import 'package:akwaaba_user_app/imports/classes/network/attendance/misc/meeting_location.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:flutter/foundation.dart';

// final TypesModelDatabase _connectionsUserModelDatabase =
//     TypesModelDatabase();

class AttendanceSchedulePlaceViewModel extends ChangeNotifier {
  int _dataId = 0;
  bool _loading = false;
  NetworkFailure? _networkFailure;
  TypesModel? _data;

  bool get loading => _loading;
  int get dataId => _dataId;
  TypesModel? get data => _data;
  NetworkFailure? get networkFailure => _networkFailure;

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  setDataId(int dataId) async {
    _dataId = dataId;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setAttendanceScheduleListModel(TypesModel data) {
    // if (kDebugMode) {
    //   print({"data.toString()": data.toString()});
    // }
    _data = data;
  }

  setNetworkFailure(NetworkFailure networkFailure) {
    _data = null;
    _networkFailure = networkFailure;
  }

  Future schedulePlace({int? schedulePlaceId}) async =>
      AttendanceSchedulePlaceNetwork.meetingPlace(
        schedulePlaceId ?? dataId,
      );

  Future virtualMeetingType({int? virtualMeetingTypeId}) async =>
      AttendanceSchedulePlaceNetwork.virtualMeetingType(
        virtualMeetingTypeId ?? dataId,
      );
}
