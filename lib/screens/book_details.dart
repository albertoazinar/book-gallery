import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Book_info extends StatefulWidget {
  const Book_info({Key? key}) : super(key: key);

  @override
  _Book_infoState createState() => _Book_infoState();
}

class _Book_infoState extends State<Book_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                   child: Image.network(
                       "https://www.atlanticcouncil.org/wp-content/uploads/2020/09/Rome-coroavirus-large-1024x683.jpg",
                        height: 150,

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
                           "the book title here ajhfdkaadla as djka",
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
                       "John Does, Lucas P",
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
                            Icons.star
                          ),
                         SizedBox(
                           width: 8,
                         ),
                         Text(
                            "4.5",
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
                     child: IconButton(
                       onPressed: (){
                         print("favourite");
                       },
                       icon: SvgPicture.asset(
                           "assets/icons/favorite_border_black_24dp.svg"
                       )
                     )
                 )
               ],
             )
           ],
         ),
       ),

    );
  }
}
