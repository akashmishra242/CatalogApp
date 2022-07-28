// ignore_for_file: prefer_const_constructors, unused_import, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_flutter/pages/home_page.dart';
import 'package:my_flutter/utils/routes.dart';
import 'package:my_flutter/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.hoverColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Image.asset(
                "assets/images/login_image.png",
                height: 350,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          labelStyle: TextStyle(
                              fontSize: 20, color: context.theme.focusColor),
                          hintStyle: TextStyle(
                            fontSize: 15,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 20, color: context.theme.focusColor),
                          hintStyle: TextStyle(fontSize: 15)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        }
                        if (value.length < 6) {
                          return "Password size should be atlest 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Material(
                      color: Colors.teal,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 30 : 5),
                      child: InkWell(
                        splashColor: Colors.grey.shade400,
                        onTap: () => moveToHome(context),
                        // onTap: () async {
                        //   setState(() {
                        //     changeButton = true;
                        //   });
                        //   await Future.delayed(Duration(seconds: 1));
                        //   await Navigator.pushNamed(
                        //       context, MyRoutes.homeRoute);
                        //   setState(() {
                        //     changeButton = false;
                        //   });
                        // },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: changeButton ? 58 : 40,
                          width: changeButton ? 60 : 90,
                          //color: Colors.teal,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.red,
                                  size: (50),
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          // decoration: BoxDecoration(
                          //   color: Colors.teal,
                          //   borderRadius:
                          //       BorderRadius.circular(changeButton ? 30 : 5),
                          // ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   child: Text(
                    //     "Login",
                    //     style:
                    //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    //   ),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(90, 40),
                    //     //backgroundColor: Colors.red
                    //   ),
                    //   onPressed: () {
                    //     //print("Successfully Logged In");
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
