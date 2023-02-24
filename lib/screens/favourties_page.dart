import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/service/fetch_manga.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  // final favouritesName = Hive.box('mangaName');
  final favourite = Hive.box('favourites');
  // late SingleMangaModel mangaDetails;
  // final FetchManga mangaService = FetchManga();
  // String? mangaName = '', coverID = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: favourite.isNotEmpty
            ? ListView.builder(
                itemCount: favourite.length,
                itemBuilder: (BuildContext context, int index) {
                  final fav = favourite.get(index);
                  print("THE FAV MANGA ID:==> ${fav[0]}");

                  return ListTile(
                    leading: Container(
                      height: 150,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://uploads.mangadex.org/covers/'
                                      '${fav[0]}/' +
                                  '${fav[1]}'),
                        ),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    title: Text(
                      fav[2] ?? "loading",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          // favouritesName.clear();
                          favourite.length <= 1
                              ? favourite.clear()
                              : favourite.deleteAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  );
                },
              )
            : Center(
                child: Text(
                  'No Favourite Manga Added',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
