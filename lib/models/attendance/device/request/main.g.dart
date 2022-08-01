// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClockingDeviceRequestModelAdapter
    extends TypeAdapter<ClockingDeviceRequestModel> {
  @override
  final int typeId = 24;

  @override
  ClockingDeviceRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClockingDeviceRequestModel(
      id: fields[0] as int?,
      clientId: fields[1] as int?,
      memberId: fields[2] as int?,
      memberAccountType: fields[3] as int?,
      systemDevice: fields[4] as int?,
      deviceType: fields[5] as String?,
      deviceId: fields[6] as String?,
      approved: fields[7] as bool?,
      approvedBy: fields[8] as int?,
      creationDate: fields[9] as DateTime?,
      successResponseMessage: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ClockingDeviceRequestModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.memberId)
      ..writeByte(3)
      ..write(obj.memberAccountType)
      ..writeByte(4)
      ..write(obj.systemDevice)
      ..writeByte(5)
      ..write(obj.deviceType)
      ..writeByte(6)
      ..write(obj.deviceId)
      ..writeByte(7)
      ..write(obj.approved)
      ..writeByte(8)
      ..write(obj.approvedBy)
      ..writeByte(9)
      ..write(obj.creationDate)
      ..writeByte(10)
      ..write(obj.successResponseMessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClockingDeviceRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
