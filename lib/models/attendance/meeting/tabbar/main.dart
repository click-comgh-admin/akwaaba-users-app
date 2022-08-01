// To parse this JSON data, do
//
//     final attendanceMeetingTabBarModel = attendanceMeetingTabBarModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

AttendanceMeetingTabBarModel attendanceMeetingTabBarModelFromJson(String str) =>
    AttendanceMeetingTabBarModel.fromJson(json.decode(str));

String attendanceMeetingTabBarModelToJson(AttendanceMeetingTabBarModel data) =>
    json.encode(data.toJson());

class AttendanceMeetingTabBarModel {
  AttendanceMeetingTabBarModel({
    required this.index,
    required this.title,
    required this.description,
    required this.icon,
    required this.child,
  });

  int index;
  String title;
  String description;
  IconData icon;
  Widget child;

  factory AttendanceMeetingTabBarModel.fromJson(Map<String, dynamic> json) =>
      AttendanceMeetingTabBarModel(
        index: json["index"],
        title: json["title"],
        description: json["description"],
        icon: json["icon"],
        child: json["child"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "title": title,
        "description": description,
        "icon": icon,
        "child": child,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
