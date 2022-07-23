// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BranchIdModelAdapter extends TypeAdapter<BranchIdModel> {
  @override
  final int typeId = 11;

  @override
  BranchIdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchIdModel(
      id: fields[1] as int?,
      name: fields[2] as String?,
      accountId: fields[3] as int?,
      createdBy: fields[4] as int?,
      creationDate: fields[5] as DateTime?,
      updatedBy: fields[6] as int?,
      updateDate: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BranchIdModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.accountId)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.creationDate)
      ..writeByte(6)
      ..write(obj.updatedBy)
      ..writeByte(7)
      ..write(obj.updateDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchIdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
