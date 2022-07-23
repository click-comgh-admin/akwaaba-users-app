// To parse this JSON data, do
//
//     final attendanceScheduleBreakModel = attendanceScheduleBreakModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:hive/hive.dart';
part 'main.g.dart';

AttendanceScheduleBreakModel attendanceScheduleBreakModelFromJson(String str) =>
    AttendanceScheduleBreakModel.fromJson(json.decode(str));

String attendanceScheduleBreakModelToJson(AttendanceScheduleBreakModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 19)
class AttendanceScheduleBreakModel {
  AttendanceScheduleBreakModel({
    this.id,
    this.meetingEventId,
    this.startBreak,
    this.endBreak,
    this.updatedBy,
    this.updateDate,
    this.date,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  AttendanceScheduleFullModel? meetingEventId;
  @HiveField(2)
  String? startBreak;
  @HiveField(3)
  String? endBreak;
  @HiveField(4)
  int? updatedBy;
  @HiveField(5)
  DateTime? updateDate;
  @HiveField(6)
  DateTime? date;

  factory AttendanceScheduleBreakModel.fromJson(Map<String, dynamic> json) =>
      AttendanceScheduleBreakModel(
        id: json["id"],
        meetingEventId:
            AttendanceScheduleFullModel.fromJson(json["meetingEventId"]),
        startBreak: json["startBreak"],
        endBreak: json["endBreak"],
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetingEventId": meetingEventId?.toJson(),
        "startBreak": startBreak,
        "endBreak": endBreak,
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
        "date": date?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
