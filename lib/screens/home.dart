import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget pageTitle(){
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
          ),
        )
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                pageTitle(),

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
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                       BoxShadow(
                         color: Colors.grey.shade300,
                         blurRadius: 6,
                         spreadRadius: 2
                       )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26)
                            ),
                            child: Row(
                                children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(26),
                                        child: SizedBox(
                                          width: 105,
                                          height: 300,
                                          child: Image.network(
                                              "https://books.google.com/books?id=iwiYGwAACAAJ&printsec=frontcover&img=1&zoom=5&sig=_L6ySKDAs-8gNK28c3NyFdO22ZM",                                               fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 26,
                                                    ),
                                                    Text(
                                                      "by Joshua Becker",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                        fontFamily: 'Roboto',
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "The More of Less",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      textAlign: TextAlign.left,
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
                                                                "4.5",
                                                                style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors.grey
                                                                ),
                                                              textAlign: TextAlign.left,
                                                            )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),

                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                        color: Colors.blue.shade200
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                                        child: Padding(
                                                            padding: const EdgeInsets.symmetric(vertical: 4),
                                                          child: Text(
                                                              "Minimalism",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors.blue.shade700
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                        )
                                    )
                                ],
                            ),
                      ),
                    )
                  ),
                )
              ],
            )

        ),
    );
  }
}
