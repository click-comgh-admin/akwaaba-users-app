// To parse this JSON data, do
//
//     final settingsTheme = settingsThemeFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';

part 'main.g.dart';

SettingsTheme settingsThemeFromJson(String str) =>
    SettingsTheme.fromJson(json.decode(str));

String settingsThemeToJson(SettingsTheme data) => json.encode(data.toJson());

@HiveType(typeId: 01)
class SettingsTheme extends HiveObject {
  SettingsTheme({
    required this.memberId,
    required this.inDarkMode,
  });

  @HiveField(0)
  int memberId;
  @HiveField(1)
  bool inDarkMode;

  factory SettingsTheme.fromJson(Map<String, dynamic> json) => SettingsTheme(
        memberId: json["memberId"],
        inDarkMode: json["inDarkMode"],
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "inDarkMode": inDarkMode,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
