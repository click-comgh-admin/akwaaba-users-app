// To parse this JSON data, do
//
//     final typesModel = typesModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'main.g.dart';

TypesModel typesModelFromJson(String str) =>
    TypesModel.fromJson(json.decode(str));

String typesModelToJson(TypesModel data) => json.encode(data.toJson());

@HiveType(typeId: 17)
class TypesModel {
  TypesModel({
    this.id,
    this.name,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  factory TypesModel.fromJson(Map<String, dynamic> json) => TypesModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
