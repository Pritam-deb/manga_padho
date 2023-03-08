class FavModel {
  String mangaID;
  String coverFileName;
  String mangaName;
  FavModel({
    required this.mangaID,
    required this.coverFileName,
    required this.mangaName,
  });

  Map<String, dynamic> toJson() => {
        'mangaID': mangaID,
        'coverFileName': coverFileName,
        'mangaName': mangaName
      };
}
