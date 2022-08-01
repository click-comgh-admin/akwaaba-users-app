// To parse this JSON data, do
//
//     final attendanceScheduleDatatableModel = attendanceScheduleDatatableModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';

AttendanceScheduleDatatableModel attendanceScheduleDatatableModelFromJson(
        String str) =>
    AttendanceScheduleDatatableModel.fromJson(json.decode(str));

String attendanceScheduleDatatableModelToJson(
        AttendanceScheduleDatatableModel data) =>
    json.encode(data.toJson());

class AttendanceScheduleDatatableModel {
  AttendanceScheduleDatatableModel({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.datatablePlugin,
    this.data,
  });

  String? draw;
  int? recordsTotal;
  int? recordsFiltered;
  bool? datatablePlugin;
  List<AttendanceScheduleModel>? data;

  factory AttendanceScheduleDatatableModel.fromJson(
          Map<String, dynamic> json) =>
      AttendanceScheduleDatatableModel(
        draw: json["draw"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        datatablePlugin: json["datatable_plugin"],
        data: List<AttendanceScheduleModel>.from(
            json["data"].map((x) => AttendanceScheduleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "datatable_plugin": datatablePlugin,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

enum MeetingViewTypes {
  now,
  upcoming,
  today,
  date,
}
