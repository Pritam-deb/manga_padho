import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_padho/model/single_manga_model.dart';
import 'package:manga_padho/screens/single_manga_page.dart';
import 'package:manga_padho/service/fetch_manga.dart';
import 'package:manga_padho/utils/constants.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  // final favouritesName = Hive.box('mangaName');
  final favourites = Hive.box('favourites');
  final FetchManga manga_service = new FetchManga();
  // late SingleMangaModel mangaDetails;
  // final FetchManga mangaService = FetchManga();
  // String? mangaName = '', coverID = '';

  @override
  void initState() {
    trymap();

    super.initState();
  }

  void trymap() {
    Iterable mangaKeys = favourites.keys;
    Map currentFav = favourites.get('801513ba-a712-498c-8f57-cae55b38cc92');
    print("The favourites are ===> ${mangaKeys.toList()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: favourites.isNotEmpty
            ? ListView.builder(
                itemCount: favourites.keys.length,
                itemBuilder: (BuildContext context, int index) {
                  var mangaKeys = favourites.keys.toList();
                  Map currentFav = favourites.get('${mangaKeys[index]}');

                  return ListTile(
                    visualDensity: VisualDensity(vertical: 4),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${MixedConstants.COVER_URL}${currentFav['mangaID']}/' +
                                  '${currentFav['coverFileName']}'),
                        ),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    title: GestureDetector(
                      //TAPPING HERE WILL LEAD TO THE PAGE OF THIS MANGA

                      onTap: () async {
                        SingleMangaModel? mangaDetails = await manga_service
                            .getSingleMangaDetails(mangaKeys[index]);
                        ;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleMangaScreen(
                              mangaID: currentFav['mangaID'],
                              coverFileName: currentFav['coverFileName'],
                              mangaDetails: mangaDetails,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        currentFav['mangaName'] ?? "loading",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          // favouritesName.clear();
                          favourites.length <= 1
                              ? favourites.clear()
                              : favourites.delete(mangaKeys[index]);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  );
                },
              )
            : const Center(
                child: Text(
                  'No Favourite Manga Added',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
