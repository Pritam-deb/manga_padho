import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_padho/service/notifiers/page_url_notifier.dart';

class ReaderScreen extends ConsumerStatefulWidget {
  final String chapterID;
  const ReaderScreen(this.chapterID, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReaderScreenState();
}

final UrlProvider = NotifierProvider<PageUrlNotifier, List<String>>(() {
  return PageUrlNotifier();
});

class _ReaderScreenState extends ConsumerState<ReaderScreen> {
  List<String> url = [];
  FutureProvider<dynamic>? UrlListProvider;

  @override
  void initState() {
    UrlListProvider = FutureProvider((ref) =>
        ref.read(UrlProvider.notifier).assignPageUrls(widget.chapterID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // url = ref.read(UrlProvider.notifier).assignPageUrls(widget.chapterID);
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        print("URL=====$url");
        return ref.watch(UrlListProvider!).when(
            data: (url) {
              var urlList = ref.watch(UrlProvider);

              return PageView.builder(
                  itemCount: urlList.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: CachedNetworkImage(
                          imageUrl: urlList[pagePosition],
                          placeholder: (a, e) => Center(
                                  child: CircularProgressIndicator(
                                color: Colors.red,
                              ))),
                    );
                  });
            },
            error: (e, a) => Container(),
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
