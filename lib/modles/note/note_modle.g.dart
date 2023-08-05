// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_modle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModleAdapter extends TypeAdapter<NoteModle> {
  @override
  final int typeId = 0;

  @override
  NoteModle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModle(
      body: fields[0] as String,
      date: fields[1] as String,
      isFavorite: fields[4] as bool?,
      colorType: fields[2] as int,
      imageUrl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModle obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.body)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.colorType)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
