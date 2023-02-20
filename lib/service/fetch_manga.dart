import 'package:http/http.dart' as http;

final String authority = 'api.mangadex.org';

Future<void> getMangaDataByMangaId(String mangaId) async {
  var unencodedPath = '/manga';
  var response = await http.get(Uri.http(authority, unencodedPath));
}
