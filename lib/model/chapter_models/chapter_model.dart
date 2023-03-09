import 'package:json_annotation/json_annotation.dart';
import 'package:manga_padho/model/chapter_models/chapter_data_model.dart';
part 'chapter_model.g.dart';

@JsonSerializable()
class ChapterModel {
  final String? result;
  final String? response;
  final List<ChapterDataModel>? data;
  final int? limit;
  final int? offset;
  final int? total;

  ChapterModel(this.result, this.response, this.data, this.limit, this.offset,
      this.total);

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);
}
