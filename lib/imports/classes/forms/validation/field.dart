import 'dart:convert';

import 'package:flutter/cupertino.dart';

FieldValidationForm fieldValidationFormFromJson(String str) =>
    FieldValidationForm.fromJson(json.decode(str));

String fieldValidationFormToJson(FieldValidationForm data) =>
    json.encode(data.toJson());

class FieldValidationForm {
  String identify;
  bool hasError = false;
  List<String>? messages = [];
  TextEditingController? controller;

  FieldValidationForm({
    required this.identify,
    this.controller,
    this.hasError = false,
    this.messages,
  });

  factory FieldValidationForm.fromJson(Map<String, dynamic> jsonData) {
    return FieldValidationForm(
      identify: json.decode(jsonData["identify"]),
      messages: jsonData["messages"],
      hasError: jsonData["hasError"],
      controller: jsonData["controller"],
    );
  }

  Map<String, dynamic> toJson() => {
        "identify": json.encode(identify),
        "hasError": hasError,
        "controller": controller,
        "messages": messages,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
