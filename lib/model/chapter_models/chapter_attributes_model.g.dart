// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterAttributesModel _$ChapterAttributesModelFromJson(
        Map<String, dynamic> json) =>
    ChapterAttributesModel(
      json['volume'] as String?,
      json['chapter'] as String?,
      json['title'] as String?,
      json['translatedLanguage'] as String?,
      json['externalUrl'] as String?,
      json['publishAt'] as String?,
      json['readableAt'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['pages'] as int?,
      json['version'] as int?,
    );

Map<String, dynamic> _$ChapterAttributesModelToJson(
        ChapterAttributesModel instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'chapter': instance.chapter,
      'title': instance.title,
      'translatedLanguage': instance.translatedLanguage,
      'externalUrl': instance.externalUrl,
      'publishAt': instance.publishAt,
      'readableAt': instance.readableAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pages': instance.pages,
      'version': instance.version,
    };
