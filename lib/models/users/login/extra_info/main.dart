// To parse this JSON data, do
//
//     final extraLoginInfoModel = extraLoginInfoModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

ExtraLoginInfoModel extraLoginInfoModelFromJson(String str) =>
    ExtraLoginInfoModel.fromJson(json.decode(str));

String extraLoginInfoModelToJson(ExtraLoginInfoModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 22)
class ExtraLoginInfoModel {
  ExtraLoginInfoModel({
    this.deviceInfoMsg,
  });

  @HiveField(0)
  List<String>? deviceInfoMsg;

  factory ExtraLoginInfoModel.fromJson(Map<String, dynamic> json) =>
      ExtraLoginInfoModel(
        deviceInfoMsg: List<String>.from(json["DeviceInfoMsg"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "DeviceInfoMsg": List<String>.from(deviceInfoMsg!.map((x) => x)),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
