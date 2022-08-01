// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

import 'package:akwaaba_user_app/models/users/login/extra_info/main.dart';
import 'package:hive/hive.dart';

part 'main.g.dart';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

@HiveType(typeId: 02)
class UserLoginModel {
  UserLoginModel({
    this.expiry,
    this.token,
    this.user,
    this.memberId,
    this.extraInfo,
    this.loginDate,
  });

  @HiveField(0)
  DateTime? expiry;
  @HiveField(1)
  String? token;
  @HiveField(2)
  QuickUser? user;
  @HiveField(3)
  int? memberId;
  @HiveField(4)
  DateTime? loginDate;
  @HiveField(5)
  ExtraLoginInfoModel? extraInfo;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    final user = QuickUser.fromJson(json["user"]);
    var rawExtraInfo = json["extra_info"];
    final extraInfo = (rawExtraInfo == null)
        ? null
        : ExtraLoginInfoModel.fromJson(rawExtraInfo);
    return UserLoginModel(
      expiry: DateTime.parse(json["expiry"]),
      token: json["token"],
      user: user,
      memberId: user.id,
      extraInfo: extraInfo,
      loginDate: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        "expiry": expiry?.toIso8601String(),
        "token": token,
        "user": user?.toJson(),
        "memberId": memberId,
        "extraInfo": extraInfo ?? extraLoginInfoModelToJson(extraInfo!),
        "loginDate": loginDate?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

@HiveType(typeId: 03)
class QuickUser {
  QuickUser({
    required this.id,
    required this.firstname,
    required this.surname,
    required this.profilePicture,
    required this.phone,
    required this.email,
    required this.clientId,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String firstname;
  @HiveField(2)
  String surname;
  @HiveField(3)
  String profilePicture;
  @HiveField(4)
  String phone;
  @HiveField(5)
  String email;
  @HiveField(6)
  int clientId;

  factory QuickUser.fromJson(Map<String, dynamic> json) => QuickUser(
        id: json["id"],
        firstname: json["firstname"],
        surname: json["surname"],
        profilePicture: json["profilePicture"],
        phone: json["phone"],
        email: json["email"],
        clientId: json["clientId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "surname": surname,
        "profilePicture": profilePicture,
        "phone": phone,
        "email": email,
        "clientId": clientId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
