
import 'package:book_gallery/screens/home.dart';
import 'package:book_gallery/screens/login.dart';
import 'package:book_gallery/screens/register.dart';
import 'package:book_gallery/screens/screen_manager.dart';
import 'package:book_gallery/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
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
          )
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
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null)
      return Home();
    else
      return Login();
  }
}

