import 'package:book_gallery/models/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_gifs/loading_gifs.dart';

class Book_info extends StatelessWidget {
  const Book_info({Key? key, required this.book}) : super(key: key);

  final Book book;

  Widget build(BuildContext context){
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
                  book.title,
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
                      book.title,
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
                      book.authors,
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
                            book.averageRating.toString(),
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
                    child: ToggleFavorite()
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
                          book.description,
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

class ToggleFavorite extends StatefulWidget {
  const ToggleFavorite({Key? key}) : super(key: key);

  @override
  _ToggleFavoriteState createState() => _ToggleFavoriteState();
}

class _ToggleFavoriteState extends State<ToggleFavorite> {
  bool _isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          toggleFavIcon();
        },
        icon: (
            _isFavourite ? Icon(  Icons.favorite_outlined, color: Colors.red,) : Icon(Icons.favorite_outline)
        )
    );
  }

  void toggleFavIcon(){
    setState(() {
        _isFavourite ? _isFavourite = false : _isFavourite = true;
    });
  }
}


