import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_photo_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class PhotoModel {
  @HiveField(0)
  int albumId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  String url;
  @HiveField(4)
  String thumbnailUrl;

  PhotoModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
