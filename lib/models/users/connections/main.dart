// To parse this JSON data, do
//
//     final userConnectionsModel = userConnectionsModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/users/connections/types/main.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';
import 'package:hive/hive.dart';

part 'main.g.dart';

UserConnectionsModel userConnectionsModelFromJson(String str) =>
    UserConnectionsModel.fromJson(json.decode(str));

String userConnectionsModelToJson(UserConnectionsModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 05)
class UserConnectionsModel {
  UserConnectionsModel({
    this.id,
    this.type,
    this.memberId,
    this.memberAccountType,
    this.connectionId,
    this.connectionAccountType,
    this.createdBy,
    this.creationDate,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  UserConnectionTypeModel? type;
  @HiveField(2)
  dynamic memberId;
  @HiveField(3)
  int? memberAccountType;
  @HiveField(4)
  dynamic connectionId;
  @HiveField(5)
  int? connectionAccountType;
  @HiveField(6)
  int? createdBy;
  @HiveField(7)
  DateTime? creationDate;

  factory UserConnectionsModel.fromJson(Map<String, dynamic> json) {
    // print({"UserConnectionsModel-json": json});
    int memberAccountType = json["memberAccountType"];
    int connectionAccountType = json["connectionAccountType"];
    return UserConnectionsModel(
      id: json["id"],
      type: UserConnectionTypeModel.fromJson(json["type"]),
      memberId: memberAccountType == 1
          ? ProfileModel.fromJson(json["memberId"])
          : OrganizationProfileModel.fromJson(json["memberId"]),
      memberAccountType: memberAccountType,
      connectionId: connectionAccountType == 1
          ? ProfileModel.fromJson(json["connectionId"])
          : OrganizationProfileModel.fromJson(json["connectionId"]),
      connectionAccountType: connectionAccountType,
      createdBy: json["createdBy"],
      creationDate: DateTime.parse(json["creationDate"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type?.toJson(),
        "memberId": memberId?.toJson(),
        "memberAccountType": memberAccountType,
        "connectionId": connectionId?.toJson(),
        "connectionAccountType": connectionAccountType,
        "createdBy": createdBy,
        "creationDate": creationDate?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
