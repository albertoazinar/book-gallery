import 'package:book_gallery/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../models/user.dart' as local;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<local.UserAuthed>(context).user;
    return Scaffold(
      body: Center(
        child: Column(
            children : [

                SizedBox(
                  height: 60,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("User"),
                      Text(
                          '${user?.email}'
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Birthdate"),
                      Text(
                        (user?.birthDate == null ) ? '     ' : '${user?.birthDate}'
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
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
