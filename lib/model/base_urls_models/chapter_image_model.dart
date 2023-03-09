import 'package:json_annotation/json_annotation.dart';

part 'chapter_image_model.g.dart';

@JsonSerializable()
class ChapterImageModel {
  final String? hash;
  final List<String>? data;
  final List<String>? dataSaver;

  ChapterImageModel(this.hash, this.data, this.dataSaver);

  factory ChapterImageModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterImageModelToJson(this);
}
