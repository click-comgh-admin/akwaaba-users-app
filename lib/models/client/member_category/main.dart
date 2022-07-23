
import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

MemberCategoryIdModel memberCategoryIdModelFromJson(String str) =>
    MemberCategoryIdModel.fromJson(json.decode(str));

String memberCategoryIdModelToJson(MemberCategoryIdModel data) => json.encode(data.toJson());

@HiveType(typeId: 14)
class MemberCategoryIdModel {
  MemberCategoryIdModel({
    this.id,
    this.clientId,
    this.category,
    this.createdBy,
    this.updatedBy,
    this.updateDate,
    this.date,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? clientId;
  @HiveField(2)
  String? category;
  @HiveField(3)
  int? createdBy;
  @HiveField(4)
  int? updatedBy;
  @HiveField(5)
  DateTime? updateDate;
  @HiveField(6)
  DateTime? date;

  factory MemberCategoryIdModel.fromJson(Map<String, dynamic> json) =>
      MemberCategoryIdModel(
        id: json["id"],
        clientId: json["clientId"],
        category: json["category"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "category": category,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "updateDate": updateDate?.toIso8601String(),
        "date": date?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
