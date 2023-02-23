import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manga_padho/model/cover_model.dart';
import 'package:manga_padho/model/manga_model.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/service/fetch_manga.dart';
import 'package:mangadex_library/mangadex_library.dart' as lib;
import 'package:http/http.dart' as http;

class HorizontalScrollList extends StatefulWidget {
  const HorizontalScrollList({super.key, required this.scrollTitle});
  final String scrollTitle;

  @override
  State<HorizontalScrollList> createState() => _HorizontalScrollListState();
}

class _HorizontalScrollListState extends State<HorizontalScrollList> {
  List<List<String>> CoverUrls = [];
  List<String> manga_names = [];
  bool _isLoading = true;

  var mangaList;
  late MangaModel manga;
  String link = '';
  final FetchManga manga_service = new FetchManga();
  void CoverLink() async {
    CoverUrls = await manga_service.fetchRandomMangaCover();
    CoverUrls.forEach((element) async {
      var name = await manga_service.getSingleMangaDetails(element[1]);
      manga_names.add(name);
      print('${manga_names}');
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      print('FOR MANGA===$manga_names');
    });
    setState(() {
      CoverUrls;
    });
    print('$CoverUrls');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CoverLink();
    });
    // print('RES==$coverUrl');
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
              itemCount: CoverUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                  'https://uploads.mangadex.org/covers/'
                                          '${CoverUrls[index][1]}/' +
                                      '${CoverUrls[index][0]}'),
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
                        child: Text(_isLoading == true
                            ? 'Loading title'
                            : manga_names[index]),
                      ),
                    ],
                  ),
                );
              }),
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [

        //       Container(
        //         height: 221,
        //         width: 200,
        //         decoration: BoxDecoration(
        //           // image: DecorationImage(
        //           //   fit: BoxFit.cover,
        //           //   image: NetworkImage(link),
        //           // ),
        //           color: Colors.red,
        //           borderRadius: BorderRadius.circular(30),
        //           boxShadow: [
        //             BoxShadow(
        //               offset: Offset(0, 10),
        //               blurRadius: 33,
        //               color: Colors.grey,
        //             )
        //           ],
        //         ),
        //       ),
        //       Container(
        //         height: 221,
        //         width: 200,
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.circular(30),
        //           boxShadow: [
        //             BoxShadow(
        //               offset: Offset(0, 10),
        //               blurRadius: 33,
        //               color: Colors.grey,
        //             )
        //           ],
        //         ),
        //       ),
        //       Container(
        //         height: 221,
        //         width: 200,
        //         decoration: BoxDecoration(
        //           color: Colors.red,
        //           borderRadius: BorderRadius.circular(30),
        //           boxShadow: [
        //             BoxShadow(
        //               offset: Offset(0, 10),
        //               blurRadius: 33,
        //               color: Colors.grey,
        //             )
        //           ],
        //         ),
        //       ),
        //       Container(
        //         height: 221,
        //         width: 200,
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.circular(30),
        //           boxShadow: [
        //             BoxShadow(
        //               offset: Offset(0, 10),
        //               blurRadius: 33,
        //               color: Colors.grey,
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
