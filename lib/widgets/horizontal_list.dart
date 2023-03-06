// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manga_padho/utils/constants.dart';
import 'package:mangadex_library/mangadex_library.dart' as lib;

import 'package:manga_padho/model/cover_model.dart';
import 'package:manga_padho/model/manga_model.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/screens/single_manga_page.dart';
import 'package:manga_padho/service/fetch_manga.dart';

class HorizontalScrollList extends StatefulWidget {
  const HorizontalScrollList(
      {Key? key, required this.scrollTitle, required this.demographic})
      : super(key: key);
  final String demographic;
  final String scrollTitle;

  @override
  State<HorizontalScrollList> createState() => _HorizontalScrollListState();
}

class _HorizontalScrollListState extends State<HorizontalScrollList> {
  List<List<String?>> mangaList = [];
  bool _isLoading = true;

  late MangaModel manga;
  String link = '';
  final FetchManga manga_service = new FetchManga();
  void CoverLink() async {
    mangaList =
        await manga_service.fetchTrendingManga(demographic: widget.demographic);
    setState(() {
      mangaList;
    });
    print('$mangaList');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CoverLink();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 26),
            children: [
              TextSpan(text: widget.scrollTitle),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: mangaList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      SingleMangaModel? mangaDetails = await manga_service
                          .getSingleMangaDetails(mangaList[index][1]!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleMangaScreen(
                            mangaID: mangaList[index][1]!,
                            coverFileName: mangaList[index][0]!,
                            mangaDetails: mangaDetails,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        UnconstrainedBox(
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${MixedConstants.COVER_URL}${mangaList[index][1]}/${mangaList[index][0]}'),
                              ),
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
                        SizedBox(
                          height: 80,
                          width: 150,
                          child: Text(mangaList[index].isEmpty
                              ? 'Unknown Title'
                              : mangaList[index][2].toString()),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
