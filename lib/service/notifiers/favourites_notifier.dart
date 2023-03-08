import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_padho/model/fav_model.dart';

class FavouriteNotifier extends Notifier<List<FavModel>> {
  final favourites = Hive.box('favourites');

  @override
  List<FavModel> build() {
    return [];
  }

  void addToFav(FavModel favourite) {
    state.add(favourite);
    favourites.put(favourite.mangaID, favourite.toJson());
    // favourites.add(favourite.toJson());
    print('The favourites are=>>> ${favourites.values}');
  }

  void removeFromFav(FavModel favourite) {
    var newFavList = [
      for (final model in state)
        if (model.mangaID != favourite.mangaID) model
    ];
    state = newFavList;
    favourites.delete(favourite.mangaID);
    print('The favourites are=>>> ${favourites.values}');
  }
}
