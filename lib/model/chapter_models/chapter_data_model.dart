import 'package:json_annotation/json_annotation.dart';
import 'package:manga_padho/model/chapter_models/chapter_attributes_model.dart';
import 'package:manga_padho/model/chapter_models/chapter_relationship_model.dart';

part 'chapter_data_model.g.dart';

@JsonSerializable()
class ChapterDataModel {
  final String? id;
  final String? type;
  final ChapterAttributesModel? attributes;
  final List<ChapterRelationshipModel>? relationships;
  ChapterDataModel(this.id, this.type, this.attributes, this.relationships);

  factory ChapterDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterDataModelToJson(this);
}
