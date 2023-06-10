// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_album_with_photo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumModelWithPhotosAdapter extends TypeAdapter<AlbumModelWithPhotos> {
  @override
  final int typeId = 8;

  @override
  AlbumModelWithPhotos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumModelWithPhotos(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      (fields[3] as List).cast<PhotoModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, AlbumModelWithPhotos obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.photos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumModelWithPhotosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModelWithPhotos _$AlbumModelWithPhotosFromJson(
        Map<String, dynamic> json) =>
    AlbumModelWithPhotos(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      (json['photos'] as List<dynamic>)
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumModelWithPhotosToJson(
        AlbumModelWithPhotos instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
    };
