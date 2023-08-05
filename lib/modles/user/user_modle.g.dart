// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModleAdapter extends TypeAdapter<UserModle> {
  @override
  final int typeId = 1;

  @override
  UserModle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModle(
      imageUser: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModle obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
