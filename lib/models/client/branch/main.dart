import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

BranchIdModel branchIdModelFromJson(String str) =>
    BranchIdModel.fromJson(json.decode(str));

String branchIdModelToJson(BranchIdModel data) => json.encode(data.toJson());

@HiveType(typeId: 11)
class BranchIdModel {
  BranchIdModel({
    this.id,
    this.name,
    this.accountId,
    this.createdBy,
    this.creationDate,
    this.updatedBy,
    this.updateDate,
  });

  @HiveField(01)
  int? id;
  @HiveField(02)
  String? name;
  @HiveField(03)
  int? accountId;
  @HiveField(04)
  int? createdBy;
  @HiveField(05)
  DateTime? creationDate;
  @HiveField(06)
  int? updatedBy;
  @HiveField(07)
  DateTime? updateDate;

  factory BranchIdModel.fromJson(Map<String, dynamic> json) => BranchIdModel(
        id: json["id"],
        name: json["name"],
        accountId: json["accountId"],
        createdBy: json["createdBy"],
        creationDate: DateTime.parse(json["creationDate"]),
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "accountId": accountId,
        "createdBy": createdBy,
        "creationDate": creationDate?.toIso8601String(),
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
