import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_album_model.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class AlbumModel {
  @HiveField(0)
  int userId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;

  AlbumModel(this.userId, this.id, this.title);

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}
