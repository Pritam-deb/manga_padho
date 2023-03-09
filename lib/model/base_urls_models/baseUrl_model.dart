import 'package:json_annotation/json_annotation.dart';
import 'package:manga_padho/model/base_urls_models/chapter_image_model.dart';

part 'baseUrl_model.g.dart';

@JsonSerializable()
class BaseUrlModel {
  final String? result;
  final String? baseUrl;
  final ChapterImageModel? chapter;

  BaseUrlModel(this.result, this.baseUrl, this.chapter);

  factory BaseUrlModel.fromJson(Map<String, dynamic> json) =>
      _$BaseUrlModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseUrlModelToJson(this);
}
