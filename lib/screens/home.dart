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
                          "Explore thousand of Books on the Go",
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
      width: MediaQuery.of(context).size.width * 0.8,
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
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

                searchBox()
              ],
            )

        ),
    );
  }
}
