import 'dart:convert';
import 'package:book_gallery/models/Book.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  //var api_key = "&key=[AIzaSyBIf48zvzOw9F7tqJFSgIUJH_kGms9eVrA]";
    Future<BookList> getBooks(query) async{
      var response;
      var books;
      String url = "https://www.googleapis.com/books/v1/volumes?q=$query&fields=kind,items(id,volumeInfo/title,volumeInfo/authors,volumeInfo/description,volumeInfo/categories,volumeInfo/averageRating,volumeInfo/imageLinks/thumbnail)";
      try{
          response = await http.get(Uri.parse(url));
          print(response.statusCode);
          if(response.statusCode == 200) {
              var jsonString = response.body;
              var jsonMap = json.decode(jsonString);
              books = BookList.fromJson(jsonMap);
          }
      }catch(Exception){
        print(Exception.toString());
      }
      return books;
  }
}