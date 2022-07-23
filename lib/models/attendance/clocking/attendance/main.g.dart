// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceClockingAttendanceModelAdapter
    extends TypeAdapter<AttendanceClockingAttendanceModel> {
  @override
  final int typeId = 20;

  @override
  AttendanceClockingAttendanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceClockingAttendanceModel(
      id: fields[0] as int?,
      meetingEventId: fields[1] as int?,
      memberId: fields[2] as int?,
      accountType: fields[3] as int?,
      inOrOut: fields[4] as bool?,
      inTime: fields[5] as DateTime?,
      outTime: fields[6] as DateTime?,
      startBreak: fields[7] as DateTime?,
      endBreak: fields[8] as DateTime?,
      clockedBy: fields[9] as int?,
      clockingMethod: fields[10] as int?,
      validate: fields[11] as bool?,
      date: fields[12] as DateTime?,
      successResponseMessage: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceClockingAttendanceModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meetingEventId)
      ..writeByte(2)
      ..write(obj.memberId)
      ..writeByte(3)
      ..write(obj.accountType)
      ..writeByte(4)
      ..write(obj.inOrOut)
      ..writeByte(5)
      ..write(obj.inTime)
      ..writeByte(6)
      ..write(obj.outTime)
      ..writeByte(7)
      ..write(obj.startBreak)
      ..writeByte(8)
      ..write(obj.endBreak)
      ..writeByte(9)
      ..write(obj.clockedBy)
      ..writeByte(10)
      ..write(obj.clockingMethod)
      ..writeByte(11)
      ..write(obj.validate)
      ..writeByte(12)
      ..write(obj.date)
      ..writeByte(13)
      ..write(obj.successResponseMessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceClockingAttendanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
