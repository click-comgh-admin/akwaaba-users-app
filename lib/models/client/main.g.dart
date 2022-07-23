// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientIdModelAdapter extends TypeAdapter<ClientIdModel> {
  @override
  final int typeId = 12;

  @override
  ClientIdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientIdModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      accountType: fields[2] as int?,
      country: fields[3] as String?,
      stateProvince: fields[4] as String?,
      applicantFirstname: fields[5] as String?,
      applicantSurname: fields[6] as String?,
      applicantGender: fields[7] as int?,
      applicantPhone: fields[8] as String?,
      applicantEmail: fields[9] as String?,
      applicantDesignationRole: fields[10] as int?,
      region: fields[11] as int?,
      district: fields[12] as int?,
      constituency: fields[13] as int?,
      community: fields[14] as String?,
      subscriptionDuration: fields[15] as String?,
      subscriptionDate: fields[16] as DateTime?,
      subscriptionFee: fields[17] as String?,
      logo: fields[18] as String?,
      status: fields[19] as int?,
      archive: fields[20] as int?,
      accountCategory: fields[21] as int?,
      creationDate: fields[22] as DateTime?,
      updatedBy: fields[23] as int?,
      updateDate: fields[24] as DateTime?,
      countryInfo: fields[25] as CountryInfoLocationModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ClientIdModel obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.accountType)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.stateProvince)
      ..writeByte(5)
      ..write(obj.applicantFirstname)
      ..writeByte(6)
      ..write(obj.applicantSurname)
      ..writeByte(7)
      ..write(obj.applicantGender)
      ..writeByte(8)
      ..write(obj.applicantPhone)
      ..writeByte(9)
      ..write(obj.applicantEmail)
      ..writeByte(10)
      ..write(obj.applicantDesignationRole)
      ..writeByte(11)
      ..write(obj.region)
      ..writeByte(12)
      ..write(obj.district)
      ..writeByte(13)
      ..write(obj.constituency)
      ..writeByte(14)
      ..write(obj.community)
      ..writeByte(15)
      ..write(obj.subscriptionDuration)
      ..writeByte(16)
      ..write(obj.subscriptionDate)
      ..writeByte(17)
      ..write(obj.subscriptionFee)
      ..writeByte(18)
      ..write(obj.logo)
      ..writeByte(19)
      ..write(obj.status)
      ..writeByte(20)
      ..write(obj.archive)
      ..writeByte(21)
      ..write(obj.accountCategory)
      ..writeByte(22)
      ..write(obj.creationDate)
      ..writeByte(23)
      ..write(obj.updatedBy)
      ..writeByte(24)
      ..write(obj.updateDate)
      ..writeByte(25)
      ..write(obj.countryInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientIdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
