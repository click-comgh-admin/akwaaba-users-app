// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceScheduleBreakModelAdapter
    extends TypeAdapter<AttendanceScheduleBreakModel> {
  @override
  final int typeId = 19;

  @override
  AttendanceScheduleBreakModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceScheduleBreakModel(
      id: fields[0] as int?,
      meetingEventId: fields[1] as AttendanceScheduleFullModel?,
      startBreak: fields[2] as String?,
      endBreak: fields[3] as String?,
      updatedBy: fields[4] as int?,
      updateDate: fields[5] as DateTime?,
      date: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceScheduleBreakModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meetingEventId)
      ..writeByte(2)
      ..write(obj.startBreak)
      ..writeByte(3)
      ..write(obj.endBreak)
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
      other is AttendanceScheduleBreakModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
