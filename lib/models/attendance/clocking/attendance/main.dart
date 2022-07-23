// To parse this JSON data, do
//
//     final attendanceClockingAttendanceModel = attendanceClockingAttendanceModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

AttendanceClockingAttendanceModel attendanceClockingAttendanceModelFromJson(
        String str) =>
    AttendanceClockingAttendanceModel.fromJson(json.decode(str));

String attendanceClockingAttendanceModelToJson(
        AttendanceClockingAttendanceModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 20)
class AttendanceClockingAttendanceModel {
  AttendanceClockingAttendanceModel({
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
    this.successResponseMessage,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? meetingEventId;
  @HiveField(2)
  int? memberId;
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
  String? successResponseMessage;

  factory AttendanceClockingAttendanceModel.fromJson(
          Map<String, dynamic> json) =>
      AttendanceClockingAttendanceModel(
        id: json["id"],
        meetingEventId: json["meetingEventId"],
        memberId: json["memberId"],
        accountType: json["accountType"],
        inOrOut: json["inOrOut"],
        inTime: json["inTime"] == null ? null : DateTime.parse(json["inTime"]),
        outTime:
            json["outTime"] == null ? null : DateTime.parse(json["outTime"]),
        startBreak: json["startBreak"] == null
            ? null
            : DateTime.parse(json["startBreak"]),
        endBreak:
            json["endBreak"] == null ? null : DateTime.parse(json["endBreak"]),
        clockedBy: json["clockedBy"],
        clockingMethod: json["clockingMethod"],
        validate: json["validate"],
        date: DateTime.parse(json["date"]),
        successResponseMessage: json["SUCCESS_RESPONSE_MESSAGE"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetingEventId": meetingEventId,
        "memberId": memberId,
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
        "SUCCESS_RESPONSE_MESSAGE": successResponseMessage,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
