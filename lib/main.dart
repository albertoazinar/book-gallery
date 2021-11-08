import 'package:book_gallery/models/Book.dart';
import 'package:book_gallery/screens/login.dart';
import 'package:book_gallery/screens/screenManager.dart';
import 'package:book_gallery/services/firebase_auth_service.dart';
import 'package:book_gallery/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart' as local;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          Provider<Firebase_Auth_Service>(
            create: (_) => Firebase_Auth_Service(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) => context.read<Firebase_Auth_Service>().authStateChanges,
              initialData: false,
          ),
          ListenableProvider<local.UserAuthed>(
            create: (_) => local.UserAuthed(),
          ),
          ChangeNotifierProvider(create: (_) => Books())
      ],
      child: MaterialApp(
        title: 'Book Gallery',
        theme: ThemeData(
          primaryColor:  Colors.white,
          accentColor: const Color.fromRGBO(150, 148, 246, 1.0),
          fontFamily: 'OpenSans',
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Theme.of(context).accentColor)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontWeight: FontWeight.bold))),
          ),
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Firebase_Auth_Service>(context);
    //final firebaseUser = context.watch<User?>();

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;

            if(user == null){
              return Login();
            }else{
              Firestore_Service.getUser().then((DocumentSnapshot snapshot) {
                if (snapshot.exists) {
                  Map<String, dynamic> user = snapshot.data() as Map<String, dynamic>;

                  print(user);

                  Provider.of<local.UserAuthed>(context, listen: false).setUser(local.User(
                      uid: snapshot.id,
                      email: user['email'],
                      fullname: user['fullname'],
                      birthDate: user['birthdate'],
                  ));

                  Provider.of<Books>(context, listen: false).fetchUserFavouriteBooks(snapshot.id);

                }else{

                }
              });
              return ScreenManager();
            }
          }else{
              return Scaffold(
                body: Center(
                   child: Container(),
                ),
              );
        }
      });
    // if(firebaseUser != null)
    //   return Home();
    // else
    //   return Login();
  }
}

