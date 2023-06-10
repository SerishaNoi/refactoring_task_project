import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_post_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class PostModel {
  @HiveField(0)
  int userId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  String body;

  PostModel(this.userId, this.id, this.title, this.body);

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
