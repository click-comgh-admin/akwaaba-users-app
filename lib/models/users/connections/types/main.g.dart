// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserConnectionTypeModelAdapter
    extends TypeAdapter<UserConnectionTypeModel> {
  @override
  final int typeId = 6;

  @override
  UserConnectionTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserConnectionTypeModel(
      id: fields[0] as int?,
      clientId: fields[1] as int?,
      type: fields[2] as String?,
      description: fields[3] as String?,
      createdBy: fields[4] as int?,
      lastUpdatedBy: fields[5] as int?,
      lastUpdateDate: fields[6] as DateTime?,
      creationDate: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserConnectionTypeModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.lastUpdatedBy)
      ..writeByte(6)
      ..write(obj.lastUpdateDate)
      ..writeByte(7)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConnectionTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
