import 'package:flutter/material.dart';

class Favourite_Books extends StatefulWidget {
  const Favourite_Books({Key? key}) : super(key: key);

  @override
  _Favourite_BooksState createState() => _Favourite_BooksState();
}

class _Favourite_BooksState extends State<Favourite_Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favourite"),
      ),
    );
  }
}
