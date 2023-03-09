import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_padho/service/api/fetch_manga.dart';
import 'package:mangadex_library/mangadex_library.dart' as lib;

class PageUrlNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  Future<void> assignPageUrls(String chapterID) async {
    // print("URLS===> $urls");
    var urlData = await FetchManga().getBaseUrls(chapterID);
    var urlList = [
      for (final x in urlData.chapter!.data!)
        lib.constructPageUrl(urlData.baseUrl!, false, urlData.chapter!.hash!, x)
    ];

    state = urlList;
  }

  List<String> getUrls() => state;
}
