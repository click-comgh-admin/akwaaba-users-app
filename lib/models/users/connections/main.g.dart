// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserConnectionsModelAdapter extends TypeAdapter<UserConnectionsModel> {
  @override
  final int typeId = 5;

  @override
  UserConnectionsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserConnectionsModel(
      id: fields[0] as int?,
      type: fields[1] as UserConnectionTypeModel?,
      memberId: fields[2] as dynamic,
      memberAccountType: fields[3] as int?,
      connectionId: fields[4] as dynamic,
      connectionAccountType: fields[5] as int?,
      createdBy: fields[6] as int?,
      creationDate: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserConnectionsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.memberId)
      ..writeByte(3)
      ..write(obj.memberAccountType)
      ..writeByte(4)
      ..write(obj.connectionId)
      ..writeByte(5)
      ..write(obj.connectionAccountType)
      ..writeByte(6)
      ..write(obj.createdBy)
      ..writeByte(7)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConnectionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
