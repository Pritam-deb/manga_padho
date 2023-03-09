// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baseUrl_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseUrlModel _$BaseUrlModelFromJson(Map<String, dynamic> json) => BaseUrlModel(
      json['result'] as String?,
      json['baseUrl'] as String?,
      json['chapter'] == null
          ? null
          : ChapterImageModel.fromJson(json['chapter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseUrlModelToJson(BaseUrlModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'baseUrl': instance.baseUrl,
      'chapter': instance.chapter,
    };
