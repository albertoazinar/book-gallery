import 'package:book_gallery/main.dart';
import 'package:book_gallery/screens/register.dart';
import 'package:book_gallery/services/firebase_auth_service.dart';
import 'package:book_gallery/services/firestore_services.dart';
import 'package:book_gallery/widgets/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? errorMessage;

  void loginWithEmailAndPassword(){
      context.read<Firebase_Auth_Service>().signIn(
        email: _emailController.text,
        password: _passwordController.text
      ).then((value) => {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => AuthenticationWrapper()
        ))
      }).catchError((error){
          setState(() {
            errorMessage = error.message;
          });
      });
  }

  void loginWithGoogle(BuildContext context){
    context.read<Firebase_Auth_Service>().signInWithGoogle().then((UserCredential? userCredential) {
      if (userCredential != null) {
        final User? user = userCredential.user;
        if (user != null) {
          Firestore_Service.addUser(
              user.uid, user.displayName, null, user.email);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
        child: Column(
                  children: [
                        SizedBox(
                          height: 60,
                        ),
                        Logo(),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Login",
                           style: TextStyle(
                             fontFamily: 'Roboto',
                             fontSize: 30
                           ),
                        ),
                        SizedBox(height: 7,),
                        Text(
                          (errorMessage != null) ? errorMessage as String: '',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.red
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Card(
                            color: Theme.of(context).accentColor,
                            child: Form(
                                key: _formkey,
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: TextFormField(
                                          controller: _emailController,
                                          keyboardType: TextInputType.emailAddress,

                                          decoration: InputDecoration(
                                                labelText: "Email Address",
                                                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Theme
                                                      .of(context)
                                                      .primaryColor, width: 1
                                                  ),
                                                ),
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.grey.shade500,
                                                    fontSize: 14
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(.6)),
                                                ),
                                          ),
                                          validator: (value){
                                            if (value!.isEmpty ||
                                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(value)) return 'Enter a valid email';

                                            return null;
                                          },
                                        ),
                                      ),

                                      SizedBox(height: 25),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: TextFormField(
                                          controller: _passwordController,
                                          keyboardType: TextInputType.text,
                                          obscureText: true,

                                          decoration: InputDecoration(
                                            labelText: "Password",
                                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Theme
                                                  .of(context)
                                                  .primaryColor, width: 1),
                                            ),
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.grey.shade500,
                                                fontSize: 14
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(.6)),
                                            ),
                                          ),
                                          validator: (value){
                                            if(value == null || value.isEmpty )
                                              return 'Enter a valid password';
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),

                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: ElevatedButton(
                                              onPressed: (){
                                                if(_formkey.currentState!.validate())
                                                    loginWithEmailAndPassword();
                                              },
                                               child: Text(
                                                   "Login",
                                                  style: TextStyle(
                                                    color: Colors.black
                                                  ),
                                               ),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty
                                                  .all(Theme
                                                  .of(
                                                  context)
                                                  .primaryColor)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(left: 155),
                                          child: TextButton(
                                            onPressed: (){},
                                            child: Text(
                                              "Forgot Password?",
                                              style: TextStyle(
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                      ),

                                      SizedBox(
                                        height: 4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Container(
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: Theme
                                                .of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: ElevatedButton.icon(
                                            onPressed: (){
                                              if(_formkey.currentState!.validate())
                                                  loginWithGoogle(context);
                                            },
                                            icon: SvgPicture.asset(
                                              "assets/icons/icons8-google.svg",
                                              color: Colors.black,
                                              width: 24,
                                            ),
                                            label: Text(
                                              "Login With Google",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                fontSize: 15
                                              ),
                                            ),
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty
                                                    .all(Theme
                                                    .of(
                                                    context)
                                                    .primaryColor)
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 17,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:35),
                                        child: TextButton(
                                          onPressed: (){
                                            Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder: (context) => Register()
                                            ));
                                          },
                                          child: Text(
                                            "Not Registered? Register here.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Roboto'
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        )
                  ],
             ),
          ),
      )
    );
  }
}
