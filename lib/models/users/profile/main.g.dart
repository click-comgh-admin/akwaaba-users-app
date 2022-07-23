// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 7;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      id: fields[0] as int?,
      clientId: fields[1] as int?,
      firstname: fields[2] as String?,
      middlename: fields[3] as String?,
      surname: fields[4] as String?,
      gender: fields[5] as int?,
      profilePicture: fields[6] as String?,
      phone: fields[7] as String?,
      email: fields[8] as String?,
      dateOfBirth: fields[9] as DateTime?,
      religion: fields[10] as int?,
      nationality: fields[11] as String?,
      countryOfResidence: fields[12] as String?,
      stateProvince: fields[13] as String?,
      region: fields[14] as int?,
      district: fields[15] as int?,
      constituency: fields[16] as int?,
      electoralArea: fields[17] as int?,
      community: fields[18] as String?,
      hometown: fields[19] as String?,
      houseNoDigitalAddress: fields[20] as String?,
      digitalAddress: fields[21] as String?,
      level: fields[22] as int?,
      status: fields[23] as int?,
      accountType: fields[24] as int?,
      memberType: fields[25] as int?,
      date: fields[26] as DateTime?,
      lastLogin: fields[27] as DateTime?,
      referenceId: fields[28] as String?,
      branchId: fields[29] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.firstname)
      ..writeByte(3)
      ..write(obj.middlename)
      ..writeByte(4)
      ..write(obj.surname)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.profilePicture)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.dateOfBirth)
      ..writeByte(10)
      ..write(obj.religion)
      ..writeByte(11)
      ..write(obj.nationality)
      ..writeByte(12)
      ..write(obj.countryOfResidence)
      ..writeByte(13)
      ..write(obj.stateProvince)
      ..writeByte(14)
      ..write(obj.region)
      ..writeByte(15)
      ..write(obj.district)
      ..writeByte(16)
      ..write(obj.constituency)
      ..writeByte(17)
      ..write(obj.electoralArea)
      ..writeByte(18)
      ..write(obj.community)
      ..writeByte(19)
      ..write(obj.hometown)
      ..writeByte(20)
      ..write(obj.houseNoDigitalAddress)
      ..writeByte(21)
      ..write(obj.digitalAddress)
      ..writeByte(22)
      ..write(obj.level)
      ..writeByte(23)
      ..write(obj.status)
      ..writeByte(24)
      ..write(obj.accountType)
      ..writeByte(25)
      ..write(obj.memberType)
      ..writeByte(26)
      ..write(obj.date)
      ..writeByte(27)
      ..write(obj.lastLogin)
      ..writeByte(28)
      ..write(obj.referenceId)
      ..writeByte(29)
      ..write(obj.branchId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
