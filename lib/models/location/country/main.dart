import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

CountryInfoLocationModel countryInfoLocationModelFromJson(String str) =>
    CountryInfoLocationModel.fromJson(json.decode(str));

String countryInfoLocationModelToJson(CountryInfoLocationModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 13)
class CountryInfoLocationModel {
  CountryInfoLocationModel({
    this.id,
    this.name,
    this.short,
    this.code,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? short;
  @HiveField(3)
  String? code;

  factory CountryInfoLocationModel.fromJson(Map<String, dynamic> json) =>
      CountryInfoLocationModel(
        id: json["id"],
        name: json["name"],
        short: json["short"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short": short,
        "code": code,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
