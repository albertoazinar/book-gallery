import 'dart:async';
import 'dart:core';

import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/services/books_api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

import 'book_details.dart';

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
                                        return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder : (context) => Book_info(book:snapshot.data!.books[index]))
                                                    );
                                                  },
                                                  child: Container(
                                                      height: 170,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(30),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors.grey.shade300,
                                                                blurRadius: 7,
                                                                spreadRadius: 2
                                                            )
                                                          ]
                                                      ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(6),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(
                                                                    26),
                                                                child: SizedBox(
                                                                  width: 105,
                                                                  height: 210,
                                                                  child: FadeInImage.assetNetwork(
                                                                    image: book.thumbnail.toString(),
                                                                    fit: BoxFit.cover,
                                                                    placeholder: cupertinoActivityIndicator,
                                                                    placeholderScale: 2,
                                                                    imageErrorBuilder: (context, error, stackTrace){
                                                                        return Image.asset(
                                                                          'assets/images/no-image.png',
                                                                          fit: BoxFit.fitWidth,
                                                                        );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Expanded(
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(
                                                                          left: 5),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height: 26,
                                                                          ),
                                                                          Container(
                                                                            width: 200,
                                                                            child: Text(
                                                                              "by "+book.authors,
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 15,
                                                                                color: Colors.grey,
                                                                                fontFamily: 'Roboto',
                                                                              ),
                                                                              textAlign: TextAlign.left,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: 10,
                                                                          ),
                                                                          Container(
                                                                            width: 200,
                                                                            child: Text(
                                                                              book.title,
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                  fontSize: 18,
                                                                                  color: Colors.black,
                                                                                  fontWeight: FontWeight
                                                                                      .w700
                                                                              ),
                                                                              textAlign: TextAlign.left,
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.star_rate_rounded,
                                                                                color: Colors.yellow,
                                                                              ),
                                                                              SizedBox(width: 6),
                                                                              Text(
                                                                                (book.averageRating == null) ? '' : book.averageRating.toString(),
                                                                                style: TextStyle(
                                                                                    fontSize: 15,
                                                                                    color: Colors.grey
                                                                                ),
                                                                                textAlign: TextAlign
                                                                                    .left,
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height: 5,
                                                                          ),

                                                                          Container(
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius
                                                                                    .circular(15),
                                                                                color: Colors.blue.shade200
                                                                            ),
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets
                                                                                    .symmetric(
                                                                                    vertical: 4),
                                                                                child: SizedBox(
                                                                                  width: 115,
                                                                                  child: Text(
                                                                                    book.categories,
                                                                                    maxLines: 1,
                                                                                    style: TextStyle(
                                                                                        fontSize: 13,
                                                                                        color: Colors.blue.shade700
                                                                                    ),
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                            )
                                                      ],
                                            ),
                                    ),
                                                ),
                                              ),
                                );
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
