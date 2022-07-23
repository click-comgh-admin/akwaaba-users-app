// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLoginModelAdapter extends TypeAdapter<UserLoginModel> {
  @override
  final int typeId = 2;

  @override
  UserLoginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLoginModel(
      expiry: fields[0] as DateTime?,
      token: fields[1] as String?,
      user: fields[2] as QuickUser?,
      memberId: fields[3] as int?,
      loginDate: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLoginModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.expiry)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.memberId)
      ..writeByte(4)
      ..write(obj.loginDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuickUserAdapter extends TypeAdapter<QuickUser> {
  @override
  final int typeId = 3;

  @override
  QuickUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuickUser(
      id: fields[0] as int,
      firstname: fields[1] as String,
      surname: fields[2] as String,
      profilePicture: fields[3] as String,
      phone: fields[4] as String,
      email: fields[5] as String,
      clientId: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuickUser obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstname)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.profilePicture)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.clientId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuickUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
