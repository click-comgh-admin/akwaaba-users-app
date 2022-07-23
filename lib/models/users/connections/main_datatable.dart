// To parse this JSON data, do
//
//     final userConnectionsDatatableModel = userConnectionsDatatableModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/users/connections/main.dart';

UserConnectionsDatatableModel userConnectionsDatatableModelFromJson(
        String str) =>
    UserConnectionsDatatableModel.fromJson(json.decode(str));

String userConnectionsDatatableModelToJson(
        UserConnectionsDatatableModel data) =>
    json.encode(data.toJson());

class UserConnectionsDatatableModel {
  UserConnectionsDatatableModel({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.datatablePlugin,
    this.data,
  });

  String? draw;
  int? recordsTotal;
  int? recordsFiltered;
  bool? datatablePlugin;
  List<UserConnectionsModel>? data;

  factory UserConnectionsDatatableModel.fromJson(Map<String, dynamic> json) {
    return UserConnectionsDatatableModel(
      draw: json["draw"],
      recordsTotal: json["recordsTotal"],
      recordsFiltered: json["recordsFiltered"],
      datatablePlugin: json["datatable_plugin"],
      data: List<UserConnectionsModel>.from(
          json["data"].map((x) => UserConnectionsModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "datatable_plugin": datatablePlugin,
        "data": List<UserConnectionsModel>.from(data!.map((x) {
          return x.toJson();
        })),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
