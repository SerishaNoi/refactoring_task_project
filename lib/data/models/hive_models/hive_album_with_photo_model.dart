import 'package:eds_test/data/models/hive_models/hive_photo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_album_with_photo_model.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class AlbumModelWithPhotos {
  @HiveField(0)
  int userId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  final List<PhotoModel> photos;

  AlbumModelWithPhotos(this.userId, this.id, this.title, this.photos);

  factory AlbumModelWithPhotos.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelWithPhotosFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelWithPhotosToJson(this);
}
