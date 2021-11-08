import 'dart:async';
import 'dart:core';
import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/models/user.dart';
import 'package:book_gallery/services/books_api_manager.dart';
import 'package:book_gallery/widgets/book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:provider/provider.dart';
import 'bookDetails.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 Future<BookList>? _book;
 final _formKey = GlobalKey<FormState>();
 String noResultText = '';
 String query = "Flutter";
 final _userInputController = TextEditingController();

 @override
 void initState(){
   super.initState();
   _book = ApiManager().getBooks(query);
 }

  Widget PageTitle(){
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Padding(
            padding: const EdgeInsets.only(top:20),
            child: Row(
              children:[
                Expanded(
                  child: Text(
                          "Explore thousand of books on the go",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto'
                          ),
                  ),
                ),
              ]
            ),
          ),
    );
  }

  Widget searchBox(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 7
          )
        ]
      ),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
              controller: _userInputController,
              decoration: InputDecoration(
                labelText: "Search for books...",
                prefixIcon: Icon(Icons.search_rounded),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                fillColor: Colors.white,
                filled: true,
                focusColor: Colors.white
              ),
              onChanged: (input){
                 print(_userInputController.text);
                 (_userInputController.text == "" || _userInputController.text == null) ? emptyUserInput() :searchBooks(_userInputController.text);
              },
           ),
         )
      ),
    );
  }

  void emptyUserInput(){
    setState(() {
      this.query = "Flutter";
    });
  }

  void searchBooks(String query) {
    var books = ApiManager().getBooks(query);

    setState(() {
      this._book = books;
    });
 }
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserAuthed>(context).user;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  PageTitle(),

                  SizedBox(
                    height: 25,
                  ),

                  searchBox(),

                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                          Text(
                              "Famous Books",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800
                              ),
                          ),
                        ]
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.57,
                      child: FutureBuilder<BookList>(
                      future: _book,
                      builder: (BuildContext context, AsyncSnapshot<BookList> snapshot) {
                          if(snapshot.hasData){
                                return ListView.builder(
                                        itemCount:  snapshot.data!.books.length,
                                        itemBuilder: (context, int index) {
                                        var book = snapshot.data!.books[index];
                                        return BookWrapper(book: book);
                                }
                            );
                          }else
                                return Text("No Books Found");
                        }
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              )

          ),
        ),
    );
  }
}
