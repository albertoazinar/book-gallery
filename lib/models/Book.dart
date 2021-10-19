import 'dart:convert';
import 'package:book_gallery/services/firestore_services.dart';
import 'package:flutter/cupertino.dart';

BookList bookListFromJson(String str) => BookList.fromJson(json.decode(str));

String bookListToJson(BookList data) => json.encode(data.toJson());

class BookList{
  BookList({
    required this.books,
  });

  List<Book> books;

  factory BookList.fromJson(Map<String, dynamic> json) => BookList(
     books: List<Book>.from(json["items"].map((x) => Book.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "items" : List<dynamic>.from(books.map((x) => x.toJson()))
  };
}

class Book{
  String id;
  String title;
  String authors;
  String description;
  String categories;
  String? averageRating;
  String? thumbnail;
  bool? isFavourite;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.categories,
    this.averageRating,
    this.thumbnail,
    this.isFavourite
  });

  Map <String, dynamic> toJson() => {
      "id" : id,
      "title" : title,
      "authors" : authors,
      "description" : description,
      "categories" : categories,
      "averageRating" : averageRating,
      "thumbnail" : thumbnail

  };

  factory Book.fromJson(Map<String, dynamic> parsedJson) => Book (
    id : parsedJson["id"],
    title : parsedJson["volumeInfo"]["title"],
    authors : (parsedJson["volumeInfo"]["authors"] == null) ? '' : (parsedJson["volumeInfo"]["authors"]  as List).join(", "),
    description : (parsedJson["volumeInfo"]["description"] == null) ? '' : parsedJson["volumeInfo"]["description"],
    categories : (parsedJson["volumeInfo"]["categories"] == null) ? '' : (parsedJson["volumeInfo"]["categories"] as List).join(", "),
    averageRating : (parsedJson["volumeInfo"]["averageRating"] == null) ? '' : (parsedJson["volumeInfo"]["averageRating"]).toString(),
    thumbnail : (parsedJson["volumeInfo"]["imageLinks"] == null) ? null : parsedJson["volumeInfo"]["imageLinks"]["thumbnail"].toString()
  );
}

class Books with ChangeNotifier{
  List<Book> _favourite = [];

  List<Book> get favourite => [... _favourite];

  Future<void> fetchUserFavouriteBooks(String uid) async{
    final querySnapshot = await Firestore_Service.getFavouriteBooks(uid);

    _favourite = [];

    querySnapshot.docs.forEach((favourite) async {
      _favourite.add(Book(
          id : favourite.id,
          title: favourite['title'],
          authors: favourite['authors'],
          description: favourite['description'],
          categories: favourite['category'],
          averageRating: favourite['averageRating'],
          thumbnail: favourite['thumbnail'],
          isFavourite : favourite['isFavourite']
      ));
      notifyListeners();
    });
    _favourite = favourite;
  }
}