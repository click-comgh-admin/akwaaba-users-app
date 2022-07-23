// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryInfoLocationModelAdapter
    extends TypeAdapter<CountryInfoLocationModel> {
  @override
  final int typeId = 13;

  @override
  CountryInfoLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryInfoLocationModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      short: fields[2] as String?,
      code: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryInfoLocationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.short)
      ..writeByte(3)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryInfoLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
