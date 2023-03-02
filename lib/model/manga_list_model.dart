class SuggestedMangaModel {
  String? result;
  String? response;
  List<Data>? data;
  int? limit;
  int? offset;
  int? total;

  SuggestedMangaModel(
      {this.result,
      this.response,
      this.data,
      this.limit,
      this.offset,
      this.total});

  SuggestedMangaModel.fromJson(Map<String, dynamic> json) {
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
  Attributes2? attributes;

  Relationships({this.id, this.type, this.attributes});

  Relationships.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    attributes = json["attributes"] == null
        ? null
        : Attributes2.fromJson(json["attributes"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    if (attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    return _data;
  }
}

class Attributes2 {
  String? description;
  String? volume;
  String? fileName;
  String? locale;
  String? createdAt;
  String? updatedAt;
  int? version;

  Attributes2(
      {this.description,
      this.volume,
      this.fileName,
      this.locale,
      this.createdAt,
      this.updatedAt,
      this.version});

  Attributes2.fromJson(Map<String, dynamic> json) {
    description = json["description"];
    volume = json["volume"];
    fileName = json["fileName"];
    locale = json["locale"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    version = json["version"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["description"] = description;
    _data["volume"] = volume;
    _data["fileName"] = fileName;
    _data["locale"] = locale;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["version"] = version;
    return _data;
  }
}

class Attributes {
  Title? title;
  List<AltTitles>? altTitles;
  Description? description;
  bool? isLocked;
  Links? links;
  String? originalLanguage;
  String? lastVolume;
  String? lastChapter;
  String? publicationDemographic;
  String? status;
  int? year;
  String? contentRating;
  List<Tags>? tags;
  String? state;
  bool? chapterNumbersResetOnNewVolume;
  String? createdAt;
  String? updatedAt;
  int? version;
  List<dynamic>? availableTranslatedLanguages;
  String? latestUploadedChapter;

  Attributes(
      {this.title,
      this.altTitles,
      this.description,
      this.isLocked,
      this.links,
      this.originalLanguage,
      this.lastVolume,
      this.lastChapter,
      this.publicationDemographic,
      this.status,
      this.year,
      this.contentRating,
      this.tags,
      this.state,
      this.chapterNumbersResetOnNewVolume,
      this.createdAt,
      this.updatedAt,
      this.version,
      this.availableTranslatedLanguages,
      this.latestUploadedChapter});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
    altTitles = json["altTitles"] == null
        ? null
        : (json["altTitles"] as List)
            .map((e) => AltTitles.fromJson(e))
            .toList();
    description = json["description"] == null
        ? null
        : Description.fromJson(json["description"]);
    isLocked = json["isLocked"];
    links = json["links"] == null ? null : Links.fromJson(json["links"]);
    originalLanguage = json["originalLanguage"];
    lastVolume = json["lastVolume"];
    lastChapter = json["lastChapter"];
    publicationDemographic = json["publicationDemographic"];
    status = json["status"];
    year = json["year"];
    contentRating = json["contentRating"];
    tags = json["tags"] == null
        ? null
        : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList();
    state = json["state"];
    chapterNumbersResetOnNewVolume = json["chapterNumbersResetOnNewVolume"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    version = json["version"];
    availableTranslatedLanguages = json["availableTranslatedLanguages"] ?? [];
    latestUploadedChapter = json["latestUploadedChapter"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (title != null) {
      _data["title"] = title?.toJson();
    }
    if (altTitles != null) {
      _data["altTitles"] = altTitles?.map((e) => e.toJson()).toList();
    }
    if (description != null) {
      _data["description"] = description?.toJson();
    }
    _data["isLocked"] = isLocked;
    if (links != null) {
      _data["links"] = links?.toJson();
    }
    _data["originalLanguage"] = originalLanguage;
    _data["lastVolume"] = lastVolume;
    _data["lastChapter"] = lastChapter;
    _data["publicationDemographic"] = publicationDemographic;
    _data["status"] = status;
    _data["year"] = year;
    _data["contentRating"] = contentRating;
    if (tags != null) {
      _data["tags"] = tags?.map((e) => e.toJson()).toList();
    }
    _data["state"] = state;
    _data["chapterNumbersResetOnNewVolume"] = chapterNumbersResetOnNewVolume;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["version"] = version;
    if (availableTranslatedLanguages != null) {
      _data["availableTranslatedLanguages"] = availableTranslatedLanguages;
    }
    _data["latestUploadedChapter"] = latestUploadedChapter;
    return _data;
  }
}

class Tags {
  String? id;
  String? type;
  Attributes1? attributes;
  List<dynamic>? relationships;

  Tags({this.id, this.type, this.attributes, this.relationships});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    attributes = json["attributes"] == null
        ? null
        : Attributes1.fromJson(json["attributes"]);
    relationships = json["relationships"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    if (attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    if (relationships != null) {
      _data["relationships"] = relationships;
    }
    return _data;
  }
}

class Attributes1 {
  Name? name;
  Description1? description;
  String? group;
  int? version;

  Attributes1({this.name, this.description, this.group, this.version});

  Attributes1.fromJson(Map<String, dynamic> json) {
    name = json["name"] == null ? null : Name.fromJson(json["name"]);
    description = json["description"] == null
        ? null
        : Description1.fromJson(json["description"]);
    group = json["group"];
    version = json["version"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (name != null) {
      _data["name"] = name?.toJson();
    }
    if (description != null) {
      _data["description"] = description?.toJson();
    }
    _data["group"] = group;
    _data["version"] = version;
    return _data;
  }
}

class Description1 {
  Description1();

  Description1.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}

class Name {
  String? en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json["en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["en"] = en;
    return _data;
  }
}

class Links {
  String? al;
  String? ap;
  String? kt;
  String? mu;
  String? mal;

  Links({this.al, this.ap, this.kt, this.mu, this.mal});

  Links.fromJson(Map<String, dynamic> json) {
    al = json["al"];
    ap = json["ap"];
    kt = json["kt"];
    mu = json["mu"];
    mal = json["mal"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["al"] = al;
    _data["ap"] = ap;
    _data["kt"] = kt;
    _data["mu"] = mu;
    _data["mal"] = mal;
    return _data;
  }
}

class Description {
  String? en;
  String? uk;

  Description({this.en, this.uk});

  Description.fromJson(Map<String, dynamic> json) {
    en = json["en"];
    uk = json["uk"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["en"] = en;
    _data["uk"] = uk;
    return _data;
  }
}

class AltTitles {
  String? jaRo;

  AltTitles({this.jaRo});

  AltTitles.fromJson(Map<String, dynamic> json) {
    jaRo = json["ja-ro"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ja-ro"] = jaRo;
    return _data;
  }
}

class Title {
  String? en;

  Title({this.en});

  Title.fromJson(Map<String, dynamic> json) {
    en = json["en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["en"] = en;
    return _data;
  }
}
