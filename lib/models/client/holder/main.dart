// import 'dart:convert';

// import 'package:akwaaba_user_app/models/location/country/main.dart';
// import 'package:hive/hive.dart';

// part 'main.g.dart';

// ClientIdModel clientIdModelFromJson(String str) =>
//     ClientIdModel.fromJson(json.decode(str));

// String clientIdModelToJson(ClientIdModel data) => json.encode(data.toJson());

// @HiveType(typeId: 12)
// class ClientIdModel {
//   ClientIdModel({
//     this.id,
//     this.name,
//     this.accountType,
//     this.country,
//     this.stateProvince,
//     this.applicantFirstname,
//     this.applicantSurname,
//     this.applicantGender,
//     this.applicantPhone,
//     this.applicantEmail,
//     this.applicantDesignationRole,
//     this.region,
//     this.district,
//     this.constituency,
//     this.community,
//     this.subscriptionDuration,
//     this.subscriptionDate,
//     this.subscriptionFee,
//     this.logo,
//     this.status,
//     this.archive,
//     this.accountCategory,
//     this.creationDate,
//     this.updatedBy,
//     this.updateDate,
//     this.countryInfo,
//   });

//   @HiveField(0)
//   int? id;
//   @HiveField(1)
//   String? name;
//   @HiveField(2)
//   int? accountType;
//   @HiveField(3)
//   String? country;
//   @HiveField(4)
//   String? stateProvince;
//   @HiveField(5)
//   String? applicantFirstname;
//   @HiveField(6)
//   String? applicantSurname;
//   @HiveField(7)
//   int? applicantGender;
//   @HiveField(8)
//   String? applicantPhone;
//   @HiveField(9)
//   String? applicantEmail;
//   @HiveField(10)
//   int? applicantDesignationRole;
//   @HiveField(11)
//   int? region;
//   @HiveField(12)
//   int? district;
//   @HiveField(13)
//   int? constituency;
//   @HiveField(14)
//   String? community;
//   @HiveField(15)
//   String? subscriptionDuration;
//   @HiveField(16)
//   DateTime? subscriptionDate;
//   @HiveField(17)
//   String? subscriptionFee;
//   @HiveField(18)
//   String? logo;
//   @HiveField(19)
//   int? status;
//   @HiveField(20)
//   int? archive;
//   @HiveField(21)
//   int? accountCategory;
//   @HiveField(22)
//   DateTime? creationDate;
//   @HiveField(23)
//   int? updatedBy;
//   @HiveField(24)
//   DateTime? updateDate;
//   @HiveField(25)
//   List<CountryInfoLocationModel>? countryInfo;

//   factory ClientIdModel.fromJson(Map<String, dynamic> json) {
//     var clientIdModel = ClientIdModel(
//         id: json["id"],
//         name: json["name"],
//         accountType: json["accountType"],
//         country: json["country"],
//         stateProvince: json["stateProvince"],
//         applicantFirstname: json["applicantFirstname"],
//         applicantSurname: json["applicantSurname"],
//         applicantGender: json["applicantGender"],
//         applicantPhone: json["applicantPhone"],
//         applicantEmail: json["applicantEmail"],
//         applicantDesignationRole: json["applicantDesignationRole"],
//         region: json["region"],
//         district: json["district"],
//         constituency: json["constituency"],
//         community: json["community"],
//         subscriptionDuration: json["subscriptionDuration"],
//         subscriptionDate: DateTime.parse(json["subscriptionDate"]),
//         subscriptionFee: json["subscriptionFee"],
//         logo: json["logo"],
//         status: json["status"],
//         archive: json["archive"],
//         accountCategory: json["accountCategory"],
//         creationDate: DateTime.parse(json["creationDate"]),
//         updatedBy: json["updatedBy"],
//         updateDate: DateTime.parse(json["updateDate"]),
//         countryInfo: List<CountryInfoLocationModel>.from(
//           json["countryInfo"].map(
//             (x) => CountryInfoLocationModel.fromJson(x),
//           ),
//         ),
//       );
//       print({"clientIdModel": clientIdModel});
//     return clientIdModel;
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "accountType": accountType,
//         "country": country,
//         "stateProvince": stateProvince,
//         "applicantFirstname": applicantFirstname,
//         "applicantSurname": applicantSurname,
//         "applicantGender": applicantGender,
//         "applicantPhone": applicantPhone,
//         "applicantEmail": applicantEmail,
//         "applicantDesignationRole": applicantDesignationRole,
//         "region": region,
//         "district": district,
//         "constituency": constituency,
//         "community": community,
//         "subscriptionDuration": subscriptionDuration,
//         "subscriptionDate": subscriptionDate?.toIso8601String(),
//         "subscriptionFee": subscriptionFee,
//         "logo": logo,
//         "status": status,
//         "archive": archive,
//         "accountCategory": accountCategory,
//         "creationDate": creationDate?.toIso8601String(),
//         "updatedBy": updatedBy,
//         "updateDate": updateDate?.toIso8601String(),
//         "countryInfo": List<CountryInfoLocationModel>.from(
//           countryInfo!.map(
//             (x) => x.toJson(),
//           ),
//         ),
//       };

//   @override
//   String toString() {
//     return toJson().toString();
//   }
// }
