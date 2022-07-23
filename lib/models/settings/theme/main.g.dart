// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsThemeAdapter extends TypeAdapter<SettingsTheme> {
  @override
  final int typeId = 1;

  @override
  SettingsTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsTheme(
      memberId: fields[0] as int,
      inDarkMode: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsTheme obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.memberId)
      ..writeByte(1)
      ..write(obj.inDarkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
