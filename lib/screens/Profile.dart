import 'package:book_gallery/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            children : [
                Text("Profile"),
                ElevatedButton(
                    onPressed: (){
                      context.read<Firebase_Auth_Service>().signOut();
                    },
                    child: Text("Logout")
                )
            ]
        ),
      ),
    );
  }
}
