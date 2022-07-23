// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@HiveType(typeId: 07)
class ProfileModel {
  ProfileModel({
    this.id,
    this.clientId,
    this.firstname,
    this.middlename,
    this.surname,
    this.gender,
    this.profilePicture,
    this.phone,
    this.email,
    this.dateOfBirth,
    this.religion,
    this.nationality,
    this.countryOfResidence,
    this.stateProvince,
    this.region,
    this.district,
    this.constituency,
    this.electoralArea,
    this.community,
    this.hometown,
    this.houseNoDigitalAddress,
    this.digitalAddress,
    this.level,
    this.status,
    this.accountType,
    this.memberType,
    this.date,
    this.lastLogin,
    this.referenceId,
    this.branchId,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? clientId;
  @HiveField(2)
  String? firstname;
  @HiveField(3)
  String? middlename;
  @HiveField(4)
  String? surname;
  @HiveField(5)
  int? gender;
  @HiveField(6)
  String? profilePicture;
  @HiveField(7)
  String? phone;
  @HiveField(8)
  String? email;
  @HiveField(9)
  DateTime? dateOfBirth;
  @HiveField(10)
  int? religion;
  @HiveField(11)
  String? nationality;
  @HiveField(12)
  String? countryOfResidence;
  @HiveField(13)
  String? stateProvince;
  @HiveField(14)
  int? region;
  @HiveField(15)
  int? district;
  @HiveField(16)
  int? constituency;
  @HiveField(17)
  int? electoralArea;
  @HiveField(18)
  String? community;
  @HiveField(19)
  String? hometown;
  @HiveField(20)
  String? houseNoDigitalAddress;
  @HiveField(21)
  String? digitalAddress;
  @HiveField(22)
  int? level;
  @HiveField(23)
  int? status;
  @HiveField(24)
  int? accountType;
  @HiveField(25)
  int? memberType;
  @HiveField(26)
  DateTime? date;
  @HiveField(27)
  DateTime? lastLogin;
  @HiveField(28)
  String? referenceId;
  @HiveField(29)
  int? branchId;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"] ?? 0,
        clientId: json["clientId"] ?? 0,
        firstname: json["firstname"],
        middlename: json["middlename"],
        surname: json["surname"],
        gender: json["gender"] ?? 0,
        profilePicture: json["profilePicture"],
        phone: json["phone"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"] ?? ""),
        religion: json["religion"] ?? 0,
        nationality: json["nationality"],
        countryOfResidence: json["countryOfResidence"],
        stateProvince: json["stateProvince"],
        region: json["region"] ?? 0,
        district: json["district"] ?? 0,
        constituency: json["constituency"] ?? 0,
        electoralArea: json["electoralArea"] ?? 0,
        community: json["community"],
        hometown: json["hometown"],
        houseNoDigitalAddress: json["houseNoDigitalAddress"],
        digitalAddress: json["digitalAddress"],
        level: json["level"] ?? 0,
        status: json["status"] ?? 0,
        accountType: json["accountType"] ?? 0,
        memberType: json["memberType"] ?? 0,
        date: DateTime.parse(json["date"]),
        lastLogin: DateTime.parse(json["last_login"]),
        referenceId: json["referenceId"],
        branchId: json["branchId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "firstname": firstname,
        "middlename": middlename,
        "surname": surname,
        "gender": gender,
        "profilePicture": profilePicture,
        "phone": phone,
        "email": email,
        "dateOfBirth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "religion": religion,
        "nationality": nationality,
        "countryOfResidence": countryOfResidence,
        "stateProvince": stateProvince,
        "region": region,
        "district": district,
        "constituency": constituency,
        "electoralArea": electoralArea,
        "community": community,
        "hometown": hometown,
        "houseNoDigitalAddress": houseNoDigitalAddress,
        "digitalAddress": digitalAddress,
        "level": level,
        "status": status,
        "accountType": accountType,
        "memberType": memberType,
        "date": date?.toIso8601String(),
        "last_login": lastLogin?.toIso8601String(),
        "referenceId": referenceId,
        "branchId": branchId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
