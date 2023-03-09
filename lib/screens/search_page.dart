import 'package:flutter/material.dart';
import 'package:manga_padho/model/searched_manga_model.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/screens/single_manga_page.dart';

import 'package:manga_padho/service/api/fetch_manga.dart';
import 'package:manga_padho/utils/colors.dart';
import 'package:manga_padho/utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchedMangaModel searchedManga;
  bool isShowSearch = true;
  String? mangaID = '', coverFile = '';
  final TextEditingController _searchController = TextEditingController();
  final FetchManga manga_service = new FetchManga();
  String mangaName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Enter the name of manga',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          CustomColors.darkestRed,
                          CustomColors.darkerRed,
                          CustomColors.redColor,
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    // print(_searchController.text.trim());
                    searchedManga = await manga_service
                        .searchManga(_searchController.text.trim());
                    mangaID = searchedManga.data![0].id;
                    coverFile = searchedManga
                        .data![0].relationships![2].attributes?.fileName;
                    mangaName =
                        searchedManga.data![0].attributes!.title!.en.toString();
                    print('FIND IT $mangaID and $coverFile');
                    if (searchedManga.result == "ok") {
                      isShowSearch = false;
                      setState(() {});
                    }
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          isShowSearch
              ? Container(
                  child: Text('Seach you manga here.'),
                )
              : SizedBox(),
          SizedBox(
            height: 25,
          ),
          isShowSearch == false
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        SingleMangaModel? mangaDetails =
                            await manga_service.getSingleMangaDetails(mangaID!);
                        ;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleMangaScreen(
                              mangaID: mangaID!,
                              coverFileName: coverFile!,
                              mangaDetails: mangaDetails,
                            ),
                          ),
                        );
                      },
                      child: UnconstrainedBox(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${MixedConstants.COVER_URL}$mangaID/$coverFile'),
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
                    ),
                    Text(mangaName),
                  ],
                )
              : SizedBox(),
        ],
      )),
    );
  }
}
