// To parse this JSON data, do
//
//     final attendanceScheduleDateModel = attendanceScheduleDateModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:hive/hive.dart';

part 'dates.g.dart';

AttendanceScheduleDateModel attendanceScheduleDateModelFromJson(String str) =>
    AttendanceScheduleDateModel.fromJson(json.decode(str));

String attendanceScheduleDateModelToJson(AttendanceScheduleDateModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 15)
class AttendanceScheduleDateModel {
  AttendanceScheduleDateModel({
    this.id,
    this.meetingEventId,
    this.date,
    this.updatedBy,
    this.updateDate,
    this.creationDate,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  AttendanceScheduleFullModel? meetingEventId;
  @HiveField(2)
  DateTime? date;
  @HiveField(3)
  int? updatedBy;
  @HiveField(4)
  DateTime? updateDate;
  @HiveField(5)
  DateTime? creationDate;

  factory AttendanceScheduleDateModel.fromJson(Map<String, dynamic> json) =>
      AttendanceScheduleDateModel(
        id: json["id"],
        meetingEventId:
            AttendanceScheduleFullModel.fromJson(json["meetingEventId"]),
        date: DateTime.parse(json["date"]),
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        creationDate: DateTime.parse(json["creationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetingEventId": meetingEventId?.toJson(),
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
        "creationDate": creationDate?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
