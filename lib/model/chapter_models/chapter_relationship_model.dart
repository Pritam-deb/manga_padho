import 'package:json_annotation/json_annotation.dart';

part 'chapter_relationship_model.g.dart';

@JsonSerializable()
class ChapterRelationshipModel {
  final String? id;
  final String? type;

  ChapterRelationshipModel(this.id, this.type);

  factory ChapterRelationshipModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterRelationshipModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterRelationshipModelToJson(this);
}
