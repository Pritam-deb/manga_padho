// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterDataModel _$ChapterDataModelFromJson(Map<String, dynamic> json) =>
    ChapterDataModel(
      json['id'] as String?,
      json['type'] as String?,
      json['attributes'] == null
          ? null
          : ChapterAttributesModel.fromJson(
              json['attributes'] as Map<String, dynamic>),
      (json['relationships'] as List<dynamic>?)
          ?.map((e) =>
              ChapterRelationshipModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChapterDataModelToJson(ChapterDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };
