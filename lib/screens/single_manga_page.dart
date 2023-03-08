// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_padho/model/fav_model.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/service/fetch_manga.dart';
import 'package:manga_padho/service/notifiers/favourites_notifier.dart';
import 'package:manga_padho/utils/constants.dart';

// class SingleMangaScreen extends ConsumerStatefulWidget {
//   const SingleMangaScreen({
//     Key? key,
//     required this.mangaID,
//     required this.coverFileName,
//     this.mangaDetails,
//   }) : super(key: key);
//   final String mangaID;
//   final String coverFileName;
//   final SingleMangaModel? mangaDetails;

//   @override
//   ConsumerState createState() => _SingleMangaScreenState();
// }

// class _SingleMangaScreenState extends ConsumerState {

// }

class SingleMangaScreen extends ConsumerStatefulWidget {
  const SingleMangaScreen({
    Key? key,
    required this.mangaID,
    required this.coverFileName,
    this.mangaDetails,
  }) : super(key: key);
  final String mangaID;
  final String coverFileName;
  final SingleMangaModel? mangaDetails;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SingleMangaScreenState();
}

class _SingleMangaScreenState extends ConsumerState<SingleMangaScreen> {
  List<SingleMangaModel> favouriteManga = [];
  List<List<String>>? chaptersInfo;
  var totalChapters;

  final favourites = Hive.box('favourites');

  final FetchManga mangaService = FetchManga();
  String? mangaName = '',
      mangaAuthor = '',
      mangaArtist = '',
      mangaState = '',
      mangaDesc = '';
  bool isFav = false;

  @override
  void initState() {
    fetchDetails();
    isFav = favourites.get(widget.mangaID) == null ? false : true;
    print('TEMP GOT== $mangaName');
    super.initState();
  }

  void fetchDetails() async {
    mangaName = widget.mangaDetails?.data!.attributes!.title!.en;
    mangaAuthor = widget.mangaDetails?.data!.relationships![0].attributes?.name;
    mangaDesc = widget.mangaDetails?.data!.attributes!.description!.en;
    // chaptersInfo = await mangaService.fetchChapterList(widget.mangaID);
    totalChapters = chaptersInfo?.last[0];
    // chaptersInfo = chaptersInfo.removeLast();
    setState(() {
      chaptersInfo;
      // totalChapters;
    });
  }

  final FavouritesProvider =
      NotifierProvider<FavouriteNotifier, List<FavModel>>(() {
    return FavouriteNotifier();
  });

  bool checkFav(List<FavModel> listFav, FavModel favourite) {
    bool isPresent = false;
    for (final model in listFav) {
      if (model.mangaID == favourite.mangaID) {
        isPresent = true;
      }
      print("IS PRESENT $isPresent");
    }
    return isPresent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mangaName ?? 'Loading',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Mangainfo(
                      mangaInformation: mangaAuthor,
                      placeholderText: 'Author',
                    ),
                    Mangainfo(
                      mangaInformation: mangaArtist,
                      placeholderText: 'Artist',
                    ),
                    Mangainfo(
                      mangaInformation: mangaState,
                      placeholderText: 'State',
                    ),

                    // Mangainfo(mangaInformation: mangaRating, placeholderText: 'Rating',),

                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              FavModel favManga = FavModel(
                                  mangaID: widget.mangaID,
                                  coverFileName: widget.coverFileName,
                                  mangaName: mangaName!);
                              var listOfFav = ref.watch(FavouritesProvider);
                              if (checkFav(listOfFav, favManga)) {
                                ref
                                    .read(FavouritesProvider.notifier)
                                    .removeFromFav(favManga);
                                setState(() {
                                  isFav = false;
                                  print("IS FAV here ===> $isFav");
                                });
                              } else {
                                ref
                                    .read(FavouritesProvider.notifier)
                                    .addToFav(favManga);
                                setState(() {
                                  isFav = true;
                                  print("IS FAV here ===> $isFav");
                                });
                              }

                              print('PRESSED');
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFav ? Colors.red : Colors.white,
                              size: 35,
                            ))),
                  ],
                ),
                Container(
                  height: 160,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${MixedConstants.COVER_URL}${widget.mangaID}/${widget.coverFileName}'),
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            ),
            Text('Description'),
            TextButton(
              onPressed: () {},
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Start reading from ch. 1',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              chaptersInfo != null
                  ? 'Number of chapters are ${totalChapters}'
                  : 'null',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ch. 1',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text('Date of upload'),
                    // ListView.builder(
                    //   itemCount: chaptersInfo!.length,
                    //   itemBuilder: (context, index) {
                    //     return Row(
                    //       children: [
                    //         Text("Chapter ${chaptersInfo?[index][3]}"),
                    //         Text("${chaptersInfo?[index][1]}")
                    //       ],
                    //     );
                    //   },
                    // )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Mangainfo extends StatelessWidget {
  const Mangainfo({
    super.key,
    required this.mangaInformation,
    this.placeholderText,
  });

  final String? mangaInformation;
  final String? placeholderText;

  @override
  Widget build(BuildContext context) {
    return Text(
      mangaInformation ?? 'Author',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    );
  }
}
