import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as local;


class Book_info extends StatefulWidget {
  const Book_info({Key? key, required this.book}) : super(key: key);
  final Book book;
  @override
  _Book_infoState createState() => _Book_infoState();
}

class _Book_infoState extends State<Book_info> {

  @override
  Widget build(BuildContext context) {
    bool _isFavourite = widget.book.isFavourite == null ? false : true;
    final user = Provider.of<local.UserAuthed>(context).user;

    void addToFavourites(){
        setState(() {
            _isFavourite = true;
        });

        Firestore_Service.addBook(user!.uid!, widget.book.title , widget.book.averageRating as String,
            widget.book.authors  , widget.book.categories ,
            widget.book.description, widget.book.thumbnail.toString(), widget.book.id, _isFavourite
        ).then((value) => print("saved"));
    }

    void removeFromFavourites(){
      setState(() {
          _isFavourite = false;
      });
      Firestore_Service.removeBookFromFavourite(user!.uid!, widget.book).then((value) => print('removed'));
    }

    void toggleFavIcon(){
      setState(() {
        _isFavourite == true ? removeFromFavourites() : addToFavourites();
      });
    }

    Widget favIcon(){
      return IconButton(
          onPressed: (){
            toggleFavIcon();
            // if(!_isFavourite)
            //     _isFavourite = false;
            // else
            //     _isFavourite = true;
          },
          icon: (
              _isFavourite ? Icon(  Icons.favorite_outlined, color: Colors.red,) : Icon(Icons.favorite_outline)
          )
      );
    }

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back,
                color: Colors.white
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title: Text(
            widget.book.title,
            textAlign: TextAlign.left,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    image: widget.book.thumbnail.toString(),
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
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Title:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        widget.book.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Authores:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        widget.book.authors,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Container(
                      child: Row(
                          children:[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              widget.book.averageRating.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 195,
                  ),
                  Expanded(
                      child: favIcon()
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          widget.book.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: 'Roboto'
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

      );
    }

  }



