// To parse this JSON data, do
//
//     final organizationProfileModel = organizationProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'main.g.dart';

OrganizationProfileModel organizationProfileModelFromJson(String str) =>
    OrganizationProfileModel.fromJson(json.decode(str));

String organizationProfileModelToJson(OrganizationProfileModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 08)
class OrganizationProfileModel {
  OrganizationProfileModel({
    this.id,
    this.clientId,
    this.organizationName,
    this.contactPersonName,
    this.contactPersonGender,
    this.dateOfIncorporation,
    this.logo,
    this.contactPersonPhone,
    this.contactPersonEmail,
    this.countryOfBusiness,
    this.stateProvince,
    this.region,
    this.district,
    this.constituency,
    this.electoralArea,
    this.community,
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
  String? organizationName;
  @HiveField(3)
  String? contactPersonName;
  @HiveField(4)
  int? contactPersonGender;
  @HiveField(5)
  DateTime? dateOfIncorporation;
  @HiveField(6)
  String? logo;
  @HiveField(7)
  String? contactPersonPhone;
  @HiveField(8)
  String? contactPersonEmail;
  @HiveField(9)
  String? countryOfBusiness;
  @HiveField(10)
  String? stateProvince;
  @HiveField(11)
  int? region;
  @HiveField(12)
  int? district;
  @HiveField(13)
  int? constituency;
  @HiveField(14)
  int? electoralArea;
  @HiveField(15)
  String? community;
  @HiveField(16)
  String? digitalAddress;
  @HiveField(17)
  int? level;
  @HiveField(18)
  int? status;
  @HiveField(19)
  int? accountType;
  @HiveField(20)
  int? memberType;
  @HiveField(21)
  DateTime? date;
  @HiveField(22)
  DateTime? lastLogin;
  @HiveField(23)
  String? referenceId;
  @HiveField(24)
  int? branchId;

  factory OrganizationProfileModel.fromJson(Map<String, dynamic> json) =>
      OrganizationProfileModel(
        id: json["id"] ?? 0,
        clientId: json["clientId"] ?? 0,
        organizationName: json["organizationName"],
        contactPersonName: json["contactPersonName"],
        contactPersonGender: json["contactPersonGender"],
        dateOfIncorporation: DateTime.parse(json["dateOfIncorporation"] ?? ""),
        logo: json["logo"],
        contactPersonPhone: json["contactPersonPhone"],
        contactPersonEmail: json["contactPersonEmail"],
        countryOfBusiness: json["countryOfBusiness"],
        stateProvince: json["stateProvince"],
        region: json["region"] ?? 0,
        district: json["district"] ?? 0,
        constituency: json["constituency"] ?? 0,
        electoralArea: json["electoralArea"] ?? 0,
        community: json["community"],
        digitalAddress: json["digitalAddress"],
        level: json["level"] ?? 0,
        status: json["status"] ?? 0,
        accountType: json["accountType"] ?? 0,
        memberType: json["memberType"] ?? 0,
        date: DateTime.parse(json["date"] ?? ""),
        lastLogin: DateTime.parse(json["last_login"] ?? ""),
        referenceId: json["referenceId"],
        branchId: json["branchId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "organizationName": organizationName,
        "contactPersonName": contactPersonName,
        "contactPersonGender": contactPersonGender,
        "dateOfIncorporation":
            "${dateOfIncorporation?.year.toString().padLeft(4, '0')}-${dateOfIncorporation?.month.toString().padLeft(2, '0')}-${dateOfIncorporation?.day.toString().padLeft(2, '0')}",
        "logo": logo,
        "contactPersonPhone": contactPersonPhone,
        "contactPersonEmail": contactPersonEmail,
        "countryOfBusiness": countryOfBusiness,
        "stateProvince": stateProvince,
        "region": region,
        "district": district,
        "constituency": constituency,
        "electoralArea": electoralArea,
        "community": community,
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
