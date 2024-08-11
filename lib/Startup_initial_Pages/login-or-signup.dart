// ignore_for_file: prefer_const_constructors

import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:career_institute/Startup_initial_Pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Log_or_Sign_init extends StatelessWidget {
  const Log_or_Sign_init({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.grey.shade900,
          Colors.blue.shade900,
          Colors.blue.shade900,
          Colors.grey.shade900
        ])),
        child: Center(
          child: Animate(
            // ignore: prefer_const_literals_to_create_immutables
            effects: [
              SlideEffect(
                begin: Offset(0, 0.1),
                end: Offset(0, 0),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
              FadeEffect(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('lib/images/career institute.jpg'))),
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Login(),
                        transition: Transition.circularReveal,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Signup(),
                        transition: Transition.circularReveal,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'VISITE OUR SOCIAL MEDIA',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.blue.shade900,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.linkedinIn,
                            color: Colors.blue.shade900,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue.shade900,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
