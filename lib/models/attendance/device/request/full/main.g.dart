// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClockingDeviceRequestFullModelAdapter
    extends TypeAdapter<ClockingDeviceRequestFullModel> {
  @override
  final int typeId = 25;

  @override
  ClockingDeviceRequestFullModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClockingDeviceRequestFullModel(
      id: fields[0] as int?,
      clientId: fields[1] as ClientIdModel?,
      memberId: fields[2] as int?,
      memberInfo: fields[3] as dynamic,
      memberAccountType: fields[4] as int?,
      systemDevice: fields[5] as int?,
      deviceType: fields[6] as String?,
      deviceId: fields[7] as String?,
      approved: fields[8] as bool?,
      approvedBy: fields[9] as int?,
      creationDate: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ClockingDeviceRequestFullModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.memberId)
      ..writeByte(3)
      ..write(obj.memberInfo)
      ..writeByte(4)
      ..write(obj.memberAccountType)
      ..writeByte(5)
      ..write(obj.systemDevice)
      ..writeByte(6)
      ..write(obj.deviceType)
      ..writeByte(7)
      ..write(obj.deviceId)
      ..writeByte(8)
      ..write(obj.approved)
      ..writeByte(9)
      ..write(obj.approvedBy)
      ..writeByte(10)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClockingDeviceRequestFullModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
