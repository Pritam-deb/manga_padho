class ChapterModel {
  String? result;
  String? response;
  List<Data>? data;
  int? limit;
  int? offset;
  int? total;

  ChapterModel(
      {this.result,
      this.response,
      this.data,
      this.limit,
      this.offset,
      this.total});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    result = json["result"];
    response = json["response"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    limit = json["limit"];
    offset = json["offset"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["result"] = result;
    _data["response"] = response;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["limit"] = limit;
    _data["offset"] = offset;
    _data["total"] = total;
    return _data;
  }
}

class Data {
  String? id;
  String? type;
  Attributes? attributes;
  List<Relationships>? relationships;

  Data({this.id, this.type, this.attributes, this.relationships});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    attributes = json["attributes"] == null
        ? null
        : Attributes.fromJson(json["attributes"]);
    relationships = json["relationships"] == null
        ? null
        : (json["relationships"] as List)
            .map((e) => Relationships.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    if (attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    if (relationships != null) {
      _data["relationships"] = relationships?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Relationships {
  String? id;
  String? type;

  Relationships({this.id, this.type});

  Relationships.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    return _data;
  }
}

class Attributes {
  String? volume;
  String? chapter;
  String? title;
  String? translatedLanguage;
  dynamic externalUrl;
  String? publishAt;
  String? readableAt;
  String? createdAt;
  String? updatedAt;
  int? pages;
  int? version;

  Attributes(
      {this.volume,
      this.chapter,
      this.title,
      this.translatedLanguage,
      this.externalUrl,
      this.publishAt,
      this.readableAt,
      this.createdAt,
      this.updatedAt,
      this.pages,
      this.version});

  Attributes.fromJson(Map<String, dynamic> json) {
    volume = json["volume"];
    chapter = json["chapter"];
    title = json["title"];
    translatedLanguage = json["translatedLanguage"];
    externalUrl = json["externalUrl"];
    publishAt = json["publishAt"];
    readableAt = json["readableAt"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    pages = json["pages"];
    version = json["version"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["volume"] = volume;
    _data["chapter"] = chapter;
    _data["title"] = title;
    _data["translatedLanguage"] = translatedLanguage;
    _data["externalUrl"] = externalUrl;
    _data["publishAt"] = publishAt;
    _data["readableAt"] = readableAt;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["pages"] = pages;
    _data["version"] = version;
    return _data;
  }
}
