import 'package:json_annotation/json_annotation.dart';

part 'chapter_attributes_model.g.dart';

@JsonSerializable()
class ChapterAttributesModel {
  final String? volume;
  final String? chapter;
  final String? title;
  final String? translatedLanguage;
  final String? externalUrl;
  final String? publishAt;
  final String? readableAt;
  final String? createdAt;
  final String? updatedAt;
  final int? pages;
  final int? version;

  ChapterAttributesModel(
      this.volume,
      this.chapter,
      this.title,
      this.translatedLanguage,
      this.externalUrl,
      this.publishAt,
      this.readableAt,
      this.createdAt,
      this.updatedAt,
      this.pages,
      this.version);

  factory ChapterAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterAttributesModelToJson(this);
}
