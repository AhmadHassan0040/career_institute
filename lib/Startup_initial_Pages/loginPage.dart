// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Pages/Dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginData formData = Get.put(LoginData());

  bool _passwordObscure = true;

  Icon _visibility = Icon(Icons.remove_red_eye_outlined);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                child: Column(
                  children: [
                    SizedBox(height: 104),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Animate(
                          effects: [
                            MoveEffect(
                                begin: Offset(-500, 0),
                                end: Offset(40, 0),
                                curve: Curves.easeInOut,
                                delay: Duration(milliseconds: 500),
                                duration: Duration(milliseconds: 1000))
                          ],
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                          ),
                        ),
                        Animate(
                          effects: [
                            MoveEffect(
                                begin: Offset(0, 0),
                                end: Offset(100, 0),
                                curve: Curves.easeInOut,
                                delay: Duration(milliseconds: 500),
                                duration: Duration(milliseconds: 1000))
                          ],
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/images/career institute.jpg'))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                child: Column(
                  children: [
                    Animate(
                      effects: [
                        SlideEffect(
                            begin: Offset(0, 1),
                            end: Offset(0, 0),
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 1000))
                      ],
                      child: Container(
                        height: screenHeight,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: TextFormField(
                                  controller: formData.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'EMAIL',
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      hintText: 'ENTER EMAIL HERE...',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  validator: (Value) {
                                    if (Value!.isEmpty) {
                                      return 'Please Enter Email First...';
                                    }
                                    final emailRegex =
                                        RegExp(r'^[^@]+@[^@]+\.[^@]+$');

                                    if (!emailRegex.hasMatch(Value)) {
                                      return 'Please enter a valid email address.';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: TextFormField(
                                  controller: formData.passController,
                                  obscureText: _passwordObscure,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _passwordObscure =
                                                  !_passwordObscure;
                                              _visibility = _passwordObscure
                                                  ? Icon(Icons
                                                      .remove_red_eye_outlined)
                                                  : Icon(Icons.remove_red_eye);
                                            });
                                          },
                                          child: _visibility),
                                      labelText: 'PASSWORD',
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      hintText: 'ENTER PASSWORD HERE...',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  validator: (Value) {
                                    if (Value!.isEmpty) {
                                      return 'Please Enter Password First...';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 40),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (formData.emailController.text ==
                                            'hasan.hasanf80@gmail.com' &&
                                        formData.passController.text ==
                                            '11111111') {
                                      Get.offAll(Dashboard(),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration: Duration(seconds: 1));
                                    }
                                  }
                                },
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: Text(
                                      'LOG IN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
