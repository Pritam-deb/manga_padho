import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:manga_padho/screens/main_page.dart';
import 'firebase_options.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:manga_padho/screens/login_page.dart';
import 'package:manga_padho/hidden_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  await Hive.openBox('favourites');
  // await Hive.openBox('mangaName');
  runApp(MaterialApp(
    title: 'Project App',
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    ),
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}
