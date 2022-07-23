// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceScheduleModelAdapter
    extends TypeAdapter<AttendanceScheduleModel> {
  @override
  final int typeId = 9;

  @override
  AttendanceScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceScheduleModel(
      id: fields[0] as int?,
      type: fields[1] as int?,
      memberType: fields[2] as int?,
      name: fields[3] as String?,
      clientId: fields[4] as int?,
      branchId: fields[5] as int?,
      memberCategoryId: fields[6] as int?,
      meetingSpan: fields[7] as int?,
      startTime: fields[8] as String?,
      closeTime: fields[9] as String?,
      latenessTime: fields[10] as String?,
      isRecuring: fields[11] as bool?,
      hasBreakTime: fields[12] as bool?,
      hasDuty: fields[13] as bool?,
      hasOvertime: fields[14] as bool?,
      virtualMeetingLink: fields[15] as String?,
      virtualMeetingType: fields[16] as int?,
      meetingLocation: fields[17] as int?,
      expectedMonthlyAttendance: fields[18] as int?,
      activeMonthlyAttendance: fields[19] as int?,
      agenda: fields[20] as String?,
      agendaFile: fields[21] as String?,
      updatedBy: fields[22] as int?,
      updateDate: fields[23] as DateTime?,
      date: fields[24] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceScheduleModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.memberType)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.clientId)
      ..writeByte(5)
      ..write(obj.branchId)
      ..writeByte(6)
      ..write(obj.memberCategoryId)
      ..writeByte(7)
      ..write(obj.meetingSpan)
      ..writeByte(8)
      ..write(obj.startTime)
      ..writeByte(9)
      ..write(obj.closeTime)
      ..writeByte(10)
      ..write(obj.latenessTime)
      ..writeByte(11)
      ..write(obj.isRecuring)
      ..writeByte(12)
      ..write(obj.hasBreakTime)
      ..writeByte(13)
      ..write(obj.hasDuty)
      ..writeByte(14)
      ..write(obj.hasOvertime)
      ..writeByte(15)
      ..write(obj.virtualMeetingLink)
      ..writeByte(16)
      ..write(obj.virtualMeetingType)
      ..writeByte(17)
      ..write(obj.meetingLocation)
      ..writeByte(18)
      ..write(obj.expectedMonthlyAttendance)
      ..writeByte(19)
      ..write(obj.activeMonthlyAttendance)
      ..writeByte(20)
      ..write(obj.agenda)
      ..writeByte(21)
      ..write(obj.agendaFile)
      ..writeByte(22)
      ..write(obj.updatedBy)
      ..writeByte(23)
      ..write(obj.updateDate)
      ..writeByte(24)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
