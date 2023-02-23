import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:manga_padho/model/cover_model.dart';
import 'package:manga_padho/model/single_manga_model.dart';

class FetchManga {
  late CoverModel cover;
  late SingleMangaModel singleManga;

  //get a list of Manga given the parameters
  void fetchMangaList() async {
    var response = await http.get(
      Uri.http('api.mangadex.org', '/cover', {
        'limit': 4.toString(),
        'includes[]': ['manga']
      }),
    );
  }

  //get a list of covers of random manga
  Future<List<List<String>>> fetchRandomMangaCover() async {
    // var unencodedPath = '/cover';
    List<List<String>> fileAndId = [];
    var response = await http.get(
      Uri.http('api.mangadex.org', '/cover', {
        'limit': 4.toString(),
        'includes[]': ['manga']
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
    // print('The List of items are:${fileAndId} ');
    return fileAndId;
  }

  //get a single manga details

  Future<SingleMangaModel> getSingleMangaDetails(String mangaID) async {
    var response = await http.get(
      Uri.http('api.mangadex.org', '/manga/$mangaID', {
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
      Uri.http('api.mangadex.org', '/manga/${mangaID}'),
    );
    singleManga =
        SingleMangaModel.fromJson(jsonDecode(response.body.toString()));
    String manga_name =
        singleManga.data!.attributes!.title!.en ?? "Unknown Title";
    // singleManga.data.attributes.title.en;
    return manga_name;
  }
}
