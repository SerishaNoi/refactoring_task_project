// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_comment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentModelAdapter extends TypeAdapter<CommentModel> {
  @override
  final int typeId = 6;

  @override
  CommentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommentModel(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CommentModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.postId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      json['postId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      json['body'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
