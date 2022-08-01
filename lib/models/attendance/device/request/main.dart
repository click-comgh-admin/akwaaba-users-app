// To parse this JSON data, do
//
//     final clockingDeviceRequestModel = clockingDeviceRequestModelFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';

part 'main.g.dart';

ClockingDeviceRequestModel clockingDeviceRequestModelFromJson(String str) =>
    ClockingDeviceRequestModel.fromJson(json.decode(str));

String clockingDeviceRequestModelToJson(ClockingDeviceRequestModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 24)
class ClockingDeviceRequestModel {
  ClockingDeviceRequestModel({
    this.id,
    this.clientId,
    this.memberId,
    this.memberAccountType,
    this.systemDevice,
    this.deviceType,
    this.deviceId,
    this.approved,
    this.approvedBy,
    this.creationDate,
    this.successResponseMessage,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? clientId;
  @HiveField(2)
  int? memberId;
  @HiveField(3)
  int? memberAccountType;
  @HiveField(4)
  int? systemDevice;
  @HiveField(5)
  String? deviceType;
  @HiveField(6)
  String? deviceId;
  @HiveField(7)
  bool? approved;
  @HiveField(8)
  int? approvedBy;
  @HiveField(9)
  DateTime? creationDate;
  @HiveField(10)
  String? successResponseMessage;

  factory ClockingDeviceRequestModel.fromJson(Map<String, dynamic> json) =>
      ClockingDeviceRequestModel(
        id: json["id"],
        clientId: json["clientId"],
        memberId: int.tryParse(json["memberId"]),
        memberAccountType: json["memberAccountType"],
        systemDevice: json["systemDevice"],
        deviceType: json["deviceType"],
        deviceId: json["deviceId"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        creationDate: DateTime.parse(json["creationDate"]),
        successResponseMessage: json["SUCCESS_RESPONSE_MESSAGE"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "memberId": memberId,
        "memberAccountType": memberAccountType,
        "systemDevice": systemDevice,
        "deviceType": deviceType,
        "deviceId": deviceId,
        "approved": approved,
        "approvedBy": approvedBy,
        "creationDate": creationDate?.toIso8601String(),
        "SUCCESS_RESPONSE_MESSAGE": successResponseMessage,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
