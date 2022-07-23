// To parse this JSON data, do
//
//     final attendanceScheduleDayModel = attendanceScheduleDayModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:hive/hive.dart';

part 'days.g.dart';

AttendanceScheduleDayModel attendanceScheduleDayModelFromJson(String str) =>
    AttendanceScheduleDayModel.fromJson(json.decode(str));

String attendanceScheduleDayModelToJson(AttendanceScheduleDayModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 16)
class AttendanceScheduleDayModel {
  AttendanceScheduleDayModel({
    this.id,
    this.meetingEventId,
    this.dayId,
    this.endDate,
    this.updatedBy,
    this.updateDate,
    this.date,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  AttendanceScheduleFullModel? meetingEventId;
  @HiveField(2)
  int? dayId;
  @HiveField(3)
  DateTime? endDate;
  @HiveField(4)
  int? updatedBy;
  @HiveField(5)
  DateTime? updateDate;
  @HiveField(6)
  DateTime? date;

  factory AttendanceScheduleDayModel.fromJson(Map<String, dynamic> json) =>
      AttendanceScheduleDayModel(
        id: json["id"],
        meetingEventId:
            AttendanceScheduleFullModel.fromJson(json["meetingEventId"]),
        dayId: json["dayId"],
        endDate: DateTime.parse(json["endDate"]),
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetingEventId": meetingEventId?.toJson(),
        "dayId": dayId,
        "endDate":
            "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
        "date": date?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
