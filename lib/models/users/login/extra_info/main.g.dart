// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExtraLoginInfoModelAdapter extends TypeAdapter<ExtraLoginInfoModel> {
  @override
  final int typeId = 22;

  @override
  ExtraLoginInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtraLoginInfoModel(
      deviceInfoMsg: (fields[0] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExtraLoginInfoModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.deviceInfoMsg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraLoginInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
