import 'package:book_gallery/widgets/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {

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
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Card(
                            color: Theme.of(context).accentColor,
                            child: Form(
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: TextFormField(
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
                                        ),
                                      ),

                                      SizedBox(height: 25),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,

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
                                              onPressed: (){},
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
                                            onPressed: (){},
                                            icon: Icon(
                                              Icons.facebook,
                                              color: Theme.of(context).accentColor,
                                            ),
                                            label: Text(
                                              "Login With Facebook",
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
                                      SizedBox(
                                        height: 17,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:35),
                                        child: TextButton(
                                          onPressed: (){},
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
