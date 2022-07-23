import 'package:hive/hive.dart';

part 'main.g.dart';

@HiveType(typeId: 06)
class UserConnectionTypeModel {
  UserConnectionTypeModel({
    this.id,
    this.clientId,
    this.type,
    this.description,
    this.createdBy,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.creationDate,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  int? clientId;
  @HiveField(2)
  String? type;
  @HiveField(3)
  String? description;
  @HiveField(4)
  int? createdBy;
  @HiveField(5)
  int? lastUpdatedBy;
  @HiveField(6)
  DateTime? lastUpdateDate;
  @HiveField(7)
  DateTime? creationDate;

  factory UserConnectionTypeModel.fromJson(Map<String, dynamic> json) =>
      UserConnectionTypeModel(
        id: json["id"],
        clientId: json["clientId"],
        type: json["type"],
        description: json["description"],
        createdBy: json["createdBy"],
        lastUpdatedBy: json["lastUpdatedBy"],
        lastUpdateDate: DateTime.parse(json["lastUpdateDate"]),
        creationDate: DateTime.parse(json["creationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "type": type,
        "description": description,
        "createdBy": createdBy,
        "lastUpdatedBy": lastUpdatedBy,
        "lastUpdateDate": lastUpdateDate?.toIso8601String(),
        "creationDate": creationDate?.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
