import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/models/user.dart';
import 'package:book_gallery/screens/book_details.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:provider/provider.dart';

class Favourite_Books extends StatelessWidget {
  const Favourite_Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteBooks = Provider.of<Books>(context).favourite;
    var user = Provider.of<UserAuthed>(context).user;

    final isEmpty = favouriteBooks.isEmpty;

    return RefreshIndicator(
      onRefresh: () async => await Provider.of<Books>(context, listen: false).fetchUserFavouriteBooks(user!.uid!),
      child: ListView.builder(
          itemCount: favouriteBooks.length,
          itemBuilder: (context, int index) {
            if(favouriteBooks.length != 1)
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder : (context) => Book_info(book:favouriteBooks[index]))
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
                                    image: favouriteBooks[index].thumbnail.toString(),
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
                                              "by "+favouriteBooks[index].authors,
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
                                              favouriteBooks[index].title,
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
                                                (favouriteBooks[index].averageRating == null) ? '' : favouriteBooks[index].averageRating.toString(),
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
                                                    favouriteBooks[index].categories,
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
            else
              return Center(
                child: Flexible(child: Text("No Favourite Books added to the collection"))
              );
          }
      )
    );
  }}

