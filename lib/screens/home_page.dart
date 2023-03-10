import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manga_padho/widgets/horizontal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 26),
                children: [
                  TextSpan(text: "What are you \nreading "),
                  TextSpan(
                    text: "today?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HorizontalScrollList(
              scrollTitle: 'High-rated titles',
              demographic: 'seinen',
            ),
            HorizontalScrollList(
              scrollTitle: 'Shounen Manga',
              demographic: 'shounen',
            ),
            Text('Signed in as ' + user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.red,
              child: const Text(
                'Log out',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
