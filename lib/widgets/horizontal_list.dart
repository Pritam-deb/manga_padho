import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manga_padho/model/manga_model.dart';
import 'package:mangadex_library/mangadex_library.dart' as lib;
import 'package:http/http.dart' as http;

class HorizontalScrollList extends StatelessWidget {
  const HorizontalScrollList({super.key, required this.scrollTitle});
  final String scrollTitle;

  @override
  Widget build(BuildContext context) {
    var mangaList;
    MangaModel manga;
    Future<MangaModel> fetchRandomManga() async {
      var unencodedPath = '/manga';
      var response = await http.get(
        Uri.http('api.mangadex.org', '/manga', {
          'limit': 1.toString(),
          'status[]': ['ongoing'],
          'includes[]': ['cover_art']
        }),
      );
      manga = MangaModel.fromJson(jsonDecode(response.body));
      print("RESPONSE: ${manga.data}");

      return manga;
    }

    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 26),
            children: [
              TextSpan(text: scrollTitle),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  fetchRandomManga();
                },
                child: Container(
                  height: 221,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 33,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 221,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 33,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Container(
                height: 221,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 33,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Container(
                height: 221,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 33,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
