import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'main.g.dart';

SidebarItemModel sidebarItemModelFromJson(String str) =>
    SidebarItemModel.fromJson(json.decode(str));

String sidebarItemModelToJson(SidebarItemModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 04)
class SidebarItemModel {
  SidebarItemModel({
    this.title,
    this.route,
    this.selected,
    this.icon,
  });

  @HiveField(0)
  String? title;
  @HiveField(1)
  PageRouteInfo? route;
  @HiveField(2)
  bool? selected;
  @HiveField(3)
  IconData? icon;

  factory SidebarItemModel.fromJson(Map<String, dynamic> json) {
    return SidebarItemModel(
      title: json["title"],
      route: json["route"],
      selected: json["selected"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "route": route,
        "selected": selected,
        "icon": icon,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}