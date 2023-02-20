// To parse this JSON data, do
//
//     final CoverModel = welcomeFromJson(jsonString);

import 'dart:convert';

CoverModel welcomeFromJson(String str) => CoverModel.fromJson(json.decode(str));

String welcomeToJson(CoverModel data) => json.encode(data.toJson());

class CoverModel {
  CoverModel({
    required this.result,
    required this.response,
    required this.data,
    required this.limit,
    required this.offset,
    required this.total,
  });

  String result;
  String response;
  List<Datum> data;
  int limit;
  int offset;
  int total;

  factory CoverModel.fromJson(Map<String, dynamic> json) => CoverModel(
        result: json["result"],
        response: json["response"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "response": response,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "limit": limit,
        "offset": offset,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  String id;
  String type;
  DatumAttributes attributes;
  List<Relationship> relationships;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
        relationships: List<Relationship>.from(
            json["relationships"].map((x) => Relationship.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
        "relationships":
            List<dynamic>.from(relationships.map((x) => x.toJson())),
      };
}

class DatumAttributes {
  DatumAttributes({
    required this.description,
    required this.volume,
    required this.fileName,
    required this.locale,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  String description;
  String volume;
  String fileName;
  String locale;
  DateTime createdAt;
  DateTime updatedAt;
  int version;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        description: json["description"],
        volume: json["volume"],
        fileName: json["fileName"],
        locale: json["locale"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "volume": volume,
        "fileName": fileName,
        "locale": locale,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "version": version,
      };
}

class Relationship {
  Relationship({
    required this.id,
    required this.type,
    this.attributes,
  });

  String id;
  String type;
  RelationshipAttributes? attributes;

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json["id"],
        type: json["type"],
        attributes: json["attributes"] == null
            ? null
            : RelationshipAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes?.toJson(),
      };
}

class RelationshipAttributes {
  RelationshipAttributes({
    required this.title,
    required this.altTitles,
    required this.description,
    required this.isLocked,
    required this.links,
    required this.originalLanguage,
    required this.lastVolume,
    required this.lastChapter,
    required this.publicationDemographic,
    required this.status,
    this.year,
    required this.contentRating,
    required this.tags,
    required this.state,
    required this.chapterNumbersResetOnNewVolume,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.availableTranslatedLanguages,
    required this.latestUploadedChapter,
  });

  TitleClass title;
  List<AltTitle> altTitles;
  TitleClass description;
  bool isLocked;
  Links links;
  String originalLanguage;
  String lastVolume;
  String lastChapter;
  String publicationDemographic;
  String status;
  dynamic year;
  String contentRating;
  List<Tag> tags;
  String state;
  bool chapterNumbersResetOnNewVolume;
  DateTime createdAt;
  DateTime updatedAt;
  int version;
  List<String> availableTranslatedLanguages;
  String latestUploadedChapter;

  factory RelationshipAttributes.fromJson(Map<String, dynamic> json) =>
      RelationshipAttributes(
        title: TitleClass.fromJson(json["title"]),
        altTitles: List<AltTitle>.from(
            json["altTitles"].map((x) => AltTitle.fromJson(x))),
        description: TitleClass.fromJson(json["description"]),
        isLocked: json["isLocked"],
        links: Links.fromJson(json["links"]),
        originalLanguage: json["originalLanguage"],
        lastVolume: json["lastVolume"],
        lastChapter: json["lastChapter"],
        publicationDemographic: json["publicationDemographic"],
        status: json["status"],
        year: json["year"],
        contentRating: json["contentRating"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        state: json["state"],
        chapterNumbersResetOnNewVolume: json["chapterNumbersResetOnNewVolume"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        version: json["version"],
        availableTranslatedLanguages: List<String>.from(
            json["availableTranslatedLanguages"].map((x) => x)),
        latestUploadedChapter: json["latestUploadedChapter"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "altTitles": List<dynamic>.from(altTitles.map((x) => x.toJson())),
        "description": description.toJson(),
        "isLocked": isLocked,
        "links": links.toJson(),
        "originalLanguage": originalLanguage,
        "lastVolume": lastVolume,
        "lastChapter": lastChapter,
        "publicationDemographic": publicationDemographic,
        "status": status,
        "year": year,
        "contentRating": contentRating,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "state": state,
        "chapterNumbersResetOnNewVolume": chapterNumbersResetOnNewVolume,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "version": version,
        "availableTranslatedLanguages":
            List<dynamic>.from(availableTranslatedLanguages.map((x) => x)),
        "latestUploadedChapter": latestUploadedChapter,
      };
}

class AltTitle {
  AltTitle({
    this.de,
    this.fr,
    this.ru,
    this.ja,
    this.zh,
    this.zhHk,
    this.ko,
  });

  String? de;
  String? fr;
  String? ru;
  String? ja;
  String? zh;
  String? zhHk;
  String? ko;

  factory AltTitle.fromJson(Map<String, dynamic> json) => AltTitle(
        de: json["de"],
        fr: json["fr"],
        ru: json["ru"],
        ja: json["ja"],
        zh: json["zh"],
        zhHk: json["zh-hk"],
        ko: json["ko"],
      );

  Map<String, dynamic> toJson() => {
        "de": de,
        "fr": fr,
        "ru": ru,
        "ja": ja,
        "zh": zh,
        "zh-hk": zhHk,
        "ko": ko,
      };
}

class TitleClass {
  TitleClass({
    required this.en,
  });

  String en;

  factory TitleClass.fromJson(Map<String, dynamic> json) => TitleClass(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Links {
  Links({
    required this.al,
    required this.ap,
    required this.kt,
    required this.mu,
    required this.mal,
  });

  String al;
  String ap;
  String kt;
  String mu;
  String mal;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        al: json["al"],
        ap: json["ap"],
        kt: json["kt"],
        mu: json["mu"],
        mal: json["mal"],
      );

  Map<String, dynamic> toJson() => {
        "al": al,
        "ap": ap,
        "kt": kt,
        "mu": mu,
        "mal": mal,
      };
}

class Tag {
  Tag({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  String id;
  String type;
  TagAttributes attributes;
  List<dynamic> relationships;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        type: json["type"],
        attributes: TagAttributes.fromJson(json["attributes"]),
        relationships: List<dynamic>.from(json["relationships"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
        "relationships": List<dynamic>.from(relationships.map((x) => x)),
      };
}

class TagAttributes {
  TagAttributes({
    required this.name,
    required this.description,
    required this.group,
    required this.version,
  });

  TitleClass name;
  PurpleDescription description;
  String group;
  int version;

  factory TagAttributes.fromJson(Map<String, dynamic> json) => TagAttributes(
        name: TitleClass.fromJson(json["name"]),
        description: PurpleDescription.fromJson(json["description"]),
        group: json["group"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "description": description.toJson(),
        "group": group,
        "version": version,
      };
}

class PurpleDescription {
  PurpleDescription();

  factory PurpleDescription.fromJson(Map<String, dynamic> json) =>
      PurpleDescription();

  Map<String, dynamic> toJson() => {};
}
