import 'package:book_gallery/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


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
                  height: 30,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30
                  ),
                ),
                SizedBox(
                  height: 10,
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
                                    labelText: "Full Name",
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
                                height: 12,
                              ),
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

                              SizedBox(height: 12),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Birth Date",
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
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      showDatePicker(
                                        context: context,
                                        initialDate:
                                        DateTime(DateTime.now().year - 4),
                                        firstDate: DateTime(1921),
                                        lastDate: DateTime(DateTime.now().year - 2),
                                      ).then((date) {

                                        });
                                      },
                                    icon: SvgPicture.asset(
                                        "assets/icons/calendar.svg",
                                        color: Theme.of(context).accentColor,
                                        width: 40,
                                    ),
                                   )
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),

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
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,

                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
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
                                height: 12,
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
                                      "Register",
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
                                    "Already have an account?",
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
