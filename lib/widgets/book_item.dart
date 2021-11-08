import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/models/user.dart';
import 'package:book_gallery/screens/bookDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:provider/provider.dart';

class BookWrapper extends StatelessWidget {
  final Book book;
  const BookWrapper({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserAuthed>(context).user;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder : (context) => BookInfo(book:book,userID:user!.uid))
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
      )
    );
  }
}
