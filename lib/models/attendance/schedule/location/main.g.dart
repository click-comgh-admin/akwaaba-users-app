// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceScheduleLocationModelAdapter
    extends TypeAdapter<AttendanceScheduleLocationModel> {
  @override
  final int typeId = 18;

  @override
  AttendanceScheduleLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceScheduleLocationModel(
      id: fields[0] as int?,
      meetingEventId: fields[1] as AttendanceScheduleFullModel?,
      latitude: fields[2] as String?,
      longitude: fields[3] as String?,
      radius: fields[4] as double?,
      updatedBy: fields[5] as int?,
      updateDate: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceScheduleLocationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meetingEventId)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude)
      ..writeByte(4)
      ..write(obj.radius)
      ..writeByte(5)
      ..write(obj.updatedBy)
      ..writeByte(6)
      ..write(obj.updateDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceScheduleLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
