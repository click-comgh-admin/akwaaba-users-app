// To parse this JSON data, do
//
//     final clockingDeviceModel = clockingDeviceModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/client/main.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';
import 'package:hive/hive.dart';

part 'main.g.dart';

ClockingDeviceModel clockingDeviceModelFromJson(String str) =>
    ClockingDeviceModel.fromJson(json.decode(str));

String clockingDeviceModelToJson(ClockingDeviceModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 23)
class ClockingDeviceModel {
  ClockingDeviceModel({
    this.id,
    this.clientId,
    this.memberId,
    this.memberInfo,
    this.memberAccountType,
    this.systemDevice,
    this.deviceType,
    this.deviceId,
    this.approvedBy,
    this.creationDate,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  ClientIdModel? clientId;
  @HiveField(2)
  int? memberId;
  @HiveField(3)
  dynamic memberInfo;
  @HiveField(4)
  int? memberAccountType;
  @HiveField(5)
  int? systemDevice;
  @HiveField(6)
  String? deviceType;
  @HiveField(7)
  String? deviceId;
  @HiveField(8)
  int? approvedBy;
  @HiveField(9)
  DateTime? creationDate;

  factory ClockingDeviceModel.fromJson(Map<String, dynamic> json) {
    int memberAccountType = json["memberAccountType"];

    return ClockingDeviceModel(
      id: json["id"],
      clientId: ClientIdModel.fromJson(json["clientId"]),
      memberId: json["memberId"],
      memberInfo: memberAccountType == 1
          ? ProfileModel.fromJson(json["memberInfo"])
          : OrganizationProfileModel.fromJson(json["memberInfo"]),
      memberAccountType: memberAccountType,
      systemDevice: json["systemDevice"],
      deviceType: json["deviceType"],
      deviceId: json["deviceId"],
      approvedBy: json["approvedBy"],
      creationDate: DateTime.parse(json["creationDate"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId?.toJson(),
        "memberId": memberId,
        "memberInfo": memberInfo?.toJson(),
        "memberAccountType": memberAccountType,
        "systemDevice": systemDevice,
        "deviceType": deviceType,
        "deviceId": deviceId,
        "approvedBy": approvedBy,
        "creationDate": creationDate?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
