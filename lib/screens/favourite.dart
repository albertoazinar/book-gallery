import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/models/user.dart';
import 'package:book_gallery/screens/book_details.dart';
import 'package:book_gallery/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:provider/provider.dart';

class Favourite_Books extends StatefulWidget{
  const Favourite_Books({Key? key}) : super(key: key);

  @override
  Favourite_BooksState createState() => Favourite_BooksState();
}

class Favourite_BooksState extends State<Favourite_Books>{
  @override
  Widget build(BuildContext context) {
    final favouriteBooks = Provider.of<Books>(context).favourite;
    var user = Provider.of<UserAuthed>(context).user;

    Future<void> _refresh () async{
      await Provider.of<Books>(context, listen: false).fetchUserFavouriteBooks(user!.uid!);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: RefreshIndicator(
          onRefresh: () => _refresh(),
          child: ListView.builder(
              itemCount: favouriteBooks.length,
              itemBuilder: (context, int index) {
                if(favouriteBooks.length != 1){
                    return BookWrapper(book: favouriteBooks[index]);
                }
                  return Center(
                    child: Row(
                        children:[
                          Expanded(child: Text("No Favourite Books added to the collection"))
                        ]
                    )
                  );
              }
          )
        ),
      ),
    );
  }}

