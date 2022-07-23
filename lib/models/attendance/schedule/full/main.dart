// To parse this JSON data, do
//
//     final attendanceScheduleFullModel = attendanceScheduleFullModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/client/branch/main.dart';
import 'package:akwaaba_user_app/models/client/main.dart';
import 'package:akwaaba_user_app/models/client/member_category/main.dart';
import 'package:hive/hive.dart';

part 'main.g.dart';

AttendanceScheduleFullModel attendanceScheduleFullModelFromJson(String str) =>
    AttendanceScheduleFullModel.fromJson(json.decode(str));

String attendanceScheduleFullModelToJson(AttendanceScheduleFullModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 10)
class AttendanceScheduleFullModel {
  AttendanceScheduleFullModel({
    this.id,
    this.type,
    this.memberType,
    this.name,
    this.clientId,
    this.branchId,
    this.memberCategoryId,
    this.meetingSpan,
    this.startTime,
    this.closeTime,
    this.latenessTime,
    this.isRecuring,
    this.hasBreakTime,
    this.hasDuty,
    this.hasOvertime,
    this.virtualMeetingLink,
    this.virtualMeetingType,
    this.meetingLocation,
    this.expectedMonthlyAttendance,
    this.activeMonthlyAttendance,
    this.agenda,
    this.agendaFile,
    this.updatedBy,
    this.updateDate,
    this.date,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? type;
  @HiveField(2)
  int? memberType;
  @HiveField(3)
  String? name;
  @HiveField(4)
  ClientIdModel? clientId;
  @HiveField(5)
  BranchIdModel? branchId;
  @HiveField(6)
  MemberCategoryIdModel? memberCategoryId;
  @HiveField(7)
  int? meetingSpan;
  @HiveField(8)
  String? startTime;
  @HiveField(9)
  String? closeTime;
  @HiveField(10)
  String? latenessTime;
  @HiveField(11)
  bool? isRecuring;
  @HiveField(12)
  bool? hasBreakTime;
  @HiveField(13)
  bool? hasDuty;
  @HiveField(14)
  bool? hasOvertime;
  @HiveField(15)
  String? virtualMeetingLink;
  @HiveField(16)
  int? virtualMeetingType;
  @HiveField(17)
  int? meetingLocation;
  @HiveField(18)
  int? expectedMonthlyAttendance;
  @HiveField(19)
  int? activeMonthlyAttendance;
  @HiveField(20)
  String? agenda;
  @HiveField(21)
  String? agendaFile;
  @HiveField(22)
  int? updatedBy;
  @HiveField(23)
  DateTime? updateDate;
  @HiveField(24)
  DateTime? date;

  factory AttendanceScheduleFullModel.fromJson(Map<String, dynamic> json) =>
      AttendanceScheduleFullModel(
        id: json["id"],
        type: json["type"],
        memberType: json["memberType"],
        name: json["name"],
        clientId: ClientIdModel.fromJson(json["clientId"]),
        branchId: BranchIdModel.fromJson(json["branchId"]),
        memberCategoryId:
            MemberCategoryIdModel.fromJson(json["memberCategoryId"]),
        meetingSpan: json["meetingSpan"],
        startTime: json["startTime"] ?? "",
        closeTime: json["closeTime"] ?? "",
        latenessTime: json["latenessTime"] ?? "",
        isRecuring: json["isRecuring"],
        hasBreakTime: json["hasBreakTime"],
        hasDuty: json["hasDuty"],
        hasOvertime: json["hasOvertime"],
        virtualMeetingLink: json["virtualMeetingLink"],
        virtualMeetingType: json["virtualMeetingType"],
        meetingLocation: json["meetingLocation"],
        expectedMonthlyAttendance: json["expectedMonthlyAttendance"],
        activeMonthlyAttendance: json["activeMonthlyAttendance"],
        agenda: json["agenda"],
        agendaFile: json["agendaFile"],
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "memberType": memberType,
        "name": name,
        "clientId": clientId?.toJson(),
        "branchId": branchId?.toJson(),
        "memberCategoryId": memberCategoryId?.toJson(),
        "meetingSpan": meetingSpan,
        "startTime": startTime,
        "closeTime": closeTime,
        "latenessTime": latenessTime,
        "isRecuring": isRecuring,
        "hasBreakTime": hasBreakTime,
        "hasDuty": hasDuty,
        "hasOvertime": hasOvertime,
        "virtualMeetingLink": virtualMeetingLink,
        "virtualMeetingType": virtualMeetingType,
        "meetingLocation": meetingLocation,
        "expectedMonthlyAttendance": expectedMonthlyAttendance,
        "activeMonthlyAttendance": activeMonthlyAttendance,
        "agenda": agenda,
        "agendaFile": agendaFile,
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
        "date": date?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
