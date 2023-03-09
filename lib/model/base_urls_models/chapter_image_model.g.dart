// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterImageModel _$ChapterImageModelFromJson(Map<String, dynamic> json) =>
    ChapterImageModel(
      json['hash'] as String?,
      (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['dataSaver'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChapterImageModelToJson(ChapterImageModel instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'data': instance.data,
      'dataSaver': instance.dataSaver,
    };
