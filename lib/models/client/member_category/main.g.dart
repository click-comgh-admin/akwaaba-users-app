// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberCategoryIdModelAdapter extends TypeAdapter<MemberCategoryIdModel> {
  @override
  final int typeId = 14;

  @override
  MemberCategoryIdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberCategoryIdModel(
      id: fields[0] as int?,
      clientId: fields[1] as int?,
      category: fields[2] as String?,
      createdBy: fields[3] as int?,
      updatedBy: fields[4] as int?,
      updateDate: fields[5] as DateTime?,
      date: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MemberCategoryIdModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.createdBy)
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
      other is MemberCategoryIdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
