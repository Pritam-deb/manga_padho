import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:manga_padho/screens/login_page.dart';
import 'package:manga_padho/hidden_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'Project App',
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    ),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
