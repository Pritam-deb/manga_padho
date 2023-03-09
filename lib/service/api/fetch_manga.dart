import 'dart:convert';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:manga_padho/model/base_urls_models/baseUrl_model.dart';
import 'package:manga_padho/model/chapter_models/chapter_model.dart';
import 'package:manga_padho/model/cover_model.dart';
import 'package:manga_padho/model/manga_list_model.dart';
import 'package:manga_padho/model/searched_manga_model.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/utils/constants.dart';

class FetchManga {
  late CoverModel cover;
  late SingleMangaModel singleManga;
  late SearchedMangaModel searchedManga;
  late SuggestedMangaModel listManga;
  late ChapterModel chapterList;

  //get a list of Manga given the parameters
  void fetchMangaList() async {
    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/cover', {
        'limit': 4.toString(),
        'includes[]': ['manga'],
        'order': {"createdAt": "desc", "updatedAt": "desc", "volume": "desc"},
      }),
    );
  }

  Future<ChapterModel> fetchChapterList(String mangaID) async {
    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/manga/$mangaID/feed', {
        'limit': 40.toString(),
        'translatedLanguage[]': 'en',
        'order[volume]': 'asc',
        'order[chapter]': 'asc'
      }),
    );
    chapterList = ChapterModel.fromJson(jsonDecode(response.body.toString()));

    return chapterList;
  }

  //get a list of covers of random manga
  Future<List<List<String>>> fetchRandomMangaCover() async {
    // var unencodedPath = '/cover';
    List<List<String>> fileAndId = [];
    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/cover', {
        'limit': 4.toString(),
        'includes[]': ['manga'],
        // 'order': {"createdAt": "desc"},
      }),
    );
    print("HERE");
    cover = CoverModel.fromJson(jsonDecode(response.body.toString()));
    cover.data?.forEach((datum) {
      String filename = datum.attributes!.fileName!;
      String id = datum.relationships![0].id!;
      List<String> array = [filename, id];
      fileAndId.add(array);
    });
    return fileAndId;
  }

  Future<List<List<String?>>> fetchTrendingManga({String? demographic}) async {
    // var unencodedPath = '/cover';
    List<List<String?>> fileAndId = [];
    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/manga', {
        'limit': 5.toString(),
        'publicationDemographic[]': [demographic],
        'contentRating[]': ['suggestive'],
        'includes[]': ['cover_art'],
        'order[rating]': ['desc'],
      }),
    );
    print("MANGA HERE");
    listManga =
        SuggestedMangaModel.fromJson(jsonDecode(response.body.toString()));

    listManga.data?.forEach((datum) {
      String? fileName;
      //for the cover name
      var relations = datum.relationships;
      relations?.forEach((element) {
        if (element.type == 'cover_art') {
          fileName = element.attributes?.fileName;
        }
      });
      //-------
      String? mangaName = datum.attributes!.title!.en.toString();
      String id = datum.id!;
      List<String?> array = [fileName, id, mangaName];
      fileAndId.add(array);
    });
    // print('The List of items are:${fileAndId} ');
    return fileAndId;
  }
  //get a single manga details

  Future<SingleMangaModel> getSingleMangaDetails(String mangaID) async {
    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/manga/$mangaID', {
        'includes[]': 'author',
        'includes[]': 'artist',
        'includes[]': 'cover_art'
      }),
    );
    singleManga =
        SingleMangaModel.fromJson(jsonDecode(response.body.toString()));
    // singleManga.data.attributes.title.en;
    return singleManga;
  }

  //get the name of manga

  Future<String> getSingleMangaName(String mangaID) async {
    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/manga/${mangaID}'),
    );
    singleManga =
        SingleMangaModel.fromJson(jsonDecode(response.body.toString()));
    String manga_name =
        singleManga.data!.attributes!.title!.en ?? "Unknown Title";
    // singleManga.data.attributes.title.en;
    return manga_name;
  }

  Future<SearchedMangaModel> searchManga(String mangaName) async {
    print('the name to search $mangaName');

    var response = await http.get(
      Uri.http(MixedConstants.BASE_URL, '/manga/', {
        'title': mangaName,
        'includes[]': 'author',
        'includes[]': 'artist',
        'includes[]': 'cover_art'
      }),
    );
    searchedManga =
        SearchedMangaModel.fromJson(jsonDecode(response.body.toString()));
    print('The manga received is===>${searchedManga.data![0].id}');
    return searchedManga;
  }

  Future<BaseUrlModel> getBaseUrls(String chapterID) async {
    var response = await http
        .get(Uri.parse('https://api.mangadex.org/at-home/server/$chapterID'));

    return BaseUrlModel.fromJson(jsonDecode(response.body));
  }
}
