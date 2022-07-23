// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceScheduleDayModelAdapter
    extends TypeAdapter<AttendanceScheduleDayModel> {
  @override
  final int typeId = 16;

  @override
  AttendanceScheduleDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceScheduleDayModel(
      id: fields[0] as int?,
      meetingEventId: fields[1] as AttendanceScheduleFullModel?,
      dayId: fields[2] as int?,
      endDate: fields[3] as DateTime?,
      updatedBy: fields[4] as int?,
      updateDate: fields[5] as DateTime?,
      date: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceScheduleDayModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meetingEventId)
      ..writeByte(2)
      ..write(obj.dayId)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.updatedBy)
      ..writeByte(5)
      ..write(obj.updateDate)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceScheduleDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
