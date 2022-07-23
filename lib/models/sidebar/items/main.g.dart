// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SidebarItemModelAdapter extends TypeAdapter<SidebarItemModel> {
  @override
  final int typeId = 4;

  @override
  SidebarItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SidebarItemModel(
      title: fields[0] as String?,
      route: fields[1] as PageRouteInfo<dynamic>?,
      selected: fields[2] as bool?,
      icon: fields[3] as IconData?,
    );
  }

  @override
  void write(BinaryWriter writer, SidebarItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.route)
      ..writeByte(2)
      ..write(obj.selected)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SidebarItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
