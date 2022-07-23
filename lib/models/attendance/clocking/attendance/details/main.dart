// To parse this JSON data, do
//
//     final attendanceClockingAttendanceDetailsModel = attendanceClockingAttendanceDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';

part 'main.g.dart';

AttendanceClockingAttendanceDetailsModel
    attendanceClockingAttendanceDetailsModelFromJson(String str) =>
        AttendanceClockingAttendanceDetailsModel.fromJson(json.decode(str));

String attendanceClockingAttendanceDetailsModelToJson(
        AttendanceClockingAttendanceDetailsModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 21)
class AttendanceClockingAttendanceDetailsModel {
  AttendanceClockingAttendanceDetailsModel({
    this.id,
    this.meetingEventId,
    this.memberId,
    this.accountType,
    this.inOrOut,
    this.inTime,
    this.outTime,
    this.startBreak,
    this.endBreak,
    this.clockedBy,
    this.clockingMethod,
    this.validate,
    this.date,
    this.clockingMethodName,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  AttendanceScheduleFullModel? meetingEventId;
  @HiveField(2)
  dynamic memberId;
  @HiveField(3)
  int? accountType;
  @HiveField(4)
  bool? inOrOut;
  @HiveField(5)
  DateTime? inTime;
  @HiveField(6)
  DateTime? outTime;
  @HiveField(7)
  DateTime? startBreak;
  @HiveField(8)
  DateTime? endBreak;
  @HiveField(9)
  int? clockedBy;
  @HiveField(10)
  int? clockingMethod;
  @HiveField(11)
  bool? validate;
  @HiveField(12)
  DateTime? date;
  @HiveField(13)
  String? clockingMethodName;

  factory AttendanceClockingAttendanceDetailsModel.fromJson(
      Map<String, dynamic> json) {
    // print({"json": json});
    int accountType = json["accountType"];
    return AttendanceClockingAttendanceDetailsModel(
      id: json["id"],
      meetingEventId:
          AttendanceScheduleFullModel.fromJson(json["meetingEventId"]),
      memberId: accountType == 1
          ? ProfileModel.fromJson(json["memberId"])
          : OrganizationProfileModel.fromJson(json["memberId"]),
      accountType: accountType,
      inOrOut: json["inOrOut"],
      inTime: json["inTime"] == null ? null : DateTime.parse(json["inTime"]),
      outTime: json["outTime"] == null ? null : DateTime.parse(json["outTime"]),
      startBreak: json["startBreak"] == null
          ? null
          : DateTime.parse(json["startBreak"]),
      endBreak:
          json["endBreak"] == null ? null : DateTime.parse(json["endBreak"]),
      clockedBy: json["clockedBy"],
      clockingMethod: json["clockingMethod"],
      validate: json["validate"],
      date: DateTime.parse(json["date"]),
      clockingMethodName: json["clockingMethodName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetingEventId": meetingEventId?.toJson(),
        "memberId": memberId.toJson(),
        "accountType": accountType,
        "inOrOut": inOrOut,
        "inTime": inTime?.toIso8601String(),
        "outTime": outTime?.toIso8601String(),
        "startBreak": startBreak?.toIso8601String(),
        "endBreak": endBreak?.toIso8601String(),
        "clockedBy": clockedBy,
        "clockingMethod": clockingMethod,
        "validate": validate,
        "date": date?.toIso8601String(),
        "clockingMethodName": clockingMethodName,
      };
}
