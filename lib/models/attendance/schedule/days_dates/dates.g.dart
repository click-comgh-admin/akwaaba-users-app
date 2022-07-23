// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceScheduleDateModelAdapter
    extends TypeAdapter<AttendanceScheduleDateModel> {
  @override
  final int typeId = 15;

  @override
  AttendanceScheduleDateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceScheduleDateModel(
      id: fields[0] as int?,
      meetingEventId: fields[1] as AttendanceScheduleFullModel?,
      date: fields[2] as DateTime?,
      updatedBy: fields[3] as int?,
      updateDate: fields[4] as DateTime?,
      creationDate: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceScheduleDateModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meetingEventId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.updatedBy)
      ..writeByte(4)
      ..write(obj.updateDate)
      ..writeByte(5)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceScheduleDateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
