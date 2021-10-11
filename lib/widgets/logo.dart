import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Padding(
        padding: const EdgeInsets.only(left: 55),
        child: Text(
          "Book Gallery",
          style: TextStyle(
            fontFamily:'OpenSans',
            color: Theme.of(context).accentColor,
            fontSize: 40,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
