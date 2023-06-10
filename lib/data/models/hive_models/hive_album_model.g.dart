// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_album_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumModelAdapter extends TypeAdapter<AlbumModel> {
  @override
  final int typeId = 7;

  @override
  AlbumModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumModel(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) => AlbumModel(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
    );

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
