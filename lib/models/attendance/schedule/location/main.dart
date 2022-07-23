// To parse this JSON data, do
//
//     final attendanceScheduleLocationModel = attendanceScheduleLocationModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:hive_flutter/adapters.dart';

part 'main.g.dart';

AttendanceScheduleLocationModel attendanceScheduleLocationModelFromJson(
        String str) =>
    AttendanceScheduleLocationModel.fromJson(json.decode(str));

String attendanceScheduleLocationModelToJson(
        AttendanceScheduleLocationModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 18)
class AttendanceScheduleLocationModel {
  AttendanceScheduleLocationModel({
    this.id,
    this.meetingEventId,
    this.latitude,
    this.longitude,
    this.radius,
    this.updatedBy,
    this.updateDate,
    this.date,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  AttendanceScheduleFullModel? meetingEventId;
  @HiveField(2)
  String? latitude;
  @HiveField(3)
  String? longitude;
  @HiveField(4)
  double? radius;
  @HiveField(5)
  int? updatedBy;
  @HiveField(6)
  DateTime? updateDate;
  DateTime? date;

  factory AttendanceScheduleLocationModel.fromJson(Map<String, dynamic> json) {
    return AttendanceScheduleLocationModel(
        id: json["id"],
        meetingEventId:
            AttendanceScheduleFullModel.fromJson(json["meetingEventId"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        radius: json["radius"].toDouble(),
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        date: DateTime.parse(json["date"]),
      );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "meetingEventId": meetingEventId?.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "radius": radius,
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
        "date": date?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
