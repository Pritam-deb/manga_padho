// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/service/fetch_manga.dart';

class SingleMangaScreen extends StatefulWidget {
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
  State<SingleMangaScreen> createState() => _SingleMangaScreenState();
}

class _SingleMangaScreenState extends State<SingleMangaScreen> {
  List<SingleMangaModel> favouriteManga = [];
  // SingleMangaModel? mangaDetails;
  final favourites = Hive.box('favourites');
  // final MangaName = Hive.box('mangaName');

  final FetchManga mangaService = FetchManga();
  String? mangaName = '',
      mangaAuthor = '',
      mangaArtist = '',
      mangaState = '',
      mangaDesc = '';

  @override
  void initState() {
    fetchDetails();

    print('TEMP GOT== $mangaName');
    super.initState();
  }

  void fetchDetails() async {
    // mangaDetails = await mangaService.getSingleMangaDetails(widget.mangaID);
    mangaName = widget.mangaDetails?.data!.attributes!.title!.en;
    mangaAuthor = widget.mangaDetails?.data!.relationships![0].attributes?.name;
    // var x = widget.mangaDetails.data!.relationships![0].attributes!.name;
    // print("AUTHOR NAME==${x.toString()}");
    // mangaArtist = widget.mangaDetails?.data!.relationships![1].attributes!.name;
    // mangaState = widget.mangaDetails.data!.attributes!.state;
    mangaDesc = widget.mangaDetails?.data!.attributes!.description!.en;
    // print('MANGAname==>${widget.mangaDetails.data!.attributes!.title!.en}');
  }

  void writeFavourite() {
    favourites.add([
      widget.mangaID,
      widget.coverFileName,
      widget.mangaDetails?.data!.attributes!.title!.en
    ]);
  }

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    // print('');
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
                    Text(
                      mangaAuthor ?? 'Author',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      mangaArtist ?? 'loading',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      mangaState ?? 'on-going',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '✰Rating',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isFav = true;
                            });
                            print('PRESSED');
                            // favouriteManga.add(widget.mangaID);
                            SnackBar(
                              content: Text('Added to favourites'),
                            );
                            if (isFav) {
                              writeFavourite();
                            } else {
                              favourites.deleteAt(index);
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFav ? Colors.red : Colors.white,
                            size: 35,
                          )),
                    ),
                  ],
                ),
                Container(
                  height: 160,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://uploads.mangadex.org/covers/'
                              '${widget.mangaID}/' +
                          '${widget.coverFileName}'),
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0, 10),
                    //     blurRadius: 33,
                    //     color: Colors.grey,
                    //   )
                    // ],
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
              'Number of chapters',
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
