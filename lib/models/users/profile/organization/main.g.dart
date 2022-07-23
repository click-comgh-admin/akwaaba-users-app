// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrganizationProfileModelAdapter
    extends TypeAdapter<OrganizationProfileModel> {
  @override
  final int typeId = 8;

  @override
  OrganizationProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrganizationProfileModel(
      id: fields[0] as int?,
      clientId: fields[1] as int?,
      organizationName: fields[2] as String?,
      contactPersonName: fields[3] as String?,
      contactPersonGender: fields[4] as int?,
      dateOfIncorporation: fields[5] as DateTime?,
      logo: fields[6] as String?,
      contactPersonPhone: fields[7] as String?,
      contactPersonEmail: fields[8] as String?,
      countryOfBusiness: fields[9] as String?,
      stateProvince: fields[10] as String?,
      region: fields[11] as int?,
      district: fields[12] as int?,
      constituency: fields[13] as int?,
      electoralArea: fields[14] as int?,
      community: fields[15] as String?,
      digitalAddress: fields[16] as String?,
      level: fields[17] as int?,
      status: fields[18] as int?,
      accountType: fields[19] as int?,
      memberType: fields[20] as int?,
      date: fields[21] as DateTime?,
      lastLogin: fields[22] as DateTime?,
      referenceId: fields[23] as String?,
      branchId: fields[24] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OrganizationProfileModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.organizationName)
      ..writeByte(3)
      ..write(obj.contactPersonName)
      ..writeByte(4)
      ..write(obj.contactPersonGender)
      ..writeByte(5)
      ..write(obj.dateOfIncorporation)
      ..writeByte(6)
      ..write(obj.logo)
      ..writeByte(7)
      ..write(obj.contactPersonPhone)
      ..writeByte(8)
      ..write(obj.contactPersonEmail)
      ..writeByte(9)
      ..write(obj.countryOfBusiness)
      ..writeByte(10)
      ..write(obj.stateProvince)
      ..writeByte(11)
      ..write(obj.region)
      ..writeByte(12)
      ..write(obj.district)
      ..writeByte(13)
      ..write(obj.constituency)
      ..writeByte(14)
      ..write(obj.electoralArea)
      ..writeByte(15)
      ..write(obj.community)
      ..writeByte(16)
      ..write(obj.digitalAddress)
      ..writeByte(17)
      ..write(obj.level)
      ..writeByte(18)
      ..write(obj.status)
      ..writeByte(19)
      ..write(obj.accountType)
      ..writeByte(20)
      ..write(obj.memberType)
      ..writeByte(21)
      ..write(obj.date)
      ..writeByte(22)
      ..write(obj.lastLogin)
      ..writeByte(23)
      ..write(obj.referenceId)
      ..writeByte(24)
      ..write(obj.branchId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
