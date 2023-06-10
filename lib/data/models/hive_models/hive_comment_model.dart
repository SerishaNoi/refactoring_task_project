import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_comment_model.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class CommentModel {
  @HiveField(0)
  int postId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String email;
  @HiveField(4)
  String body;

  CommentModel(
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  );

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
