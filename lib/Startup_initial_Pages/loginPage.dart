// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Pages/Leads_Form.dart';
import 'package:career_institute/Startup_initial_Pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  Login({super.key});

  LoginData formData = Get.put(LoginData());

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
              SizedBox(height: 104),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Animate(
                    effects: [
                      MoveEffect(
                          begin: Offset(-500, 0),
                          end: Offset(0, 0),
                          curve: Curves.easeInOut,
                          delay: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 1000))
                    ],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'LOGIN TO\n    ACCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Animate(
                    effects: [
                      MoveEffect(
                          begin: Offset(-57, 0),
                          end: Offset(50, 0),
                          curve: Curves.easeInOut,
                          delay: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 1000))
                    ],
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                                    borderRadius: BorderRadius.circular(8))),
                            validator: (Value) {
                              if (Value!.isEmpty) {
                                return 'Please Enter Email First...';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            controller: formData.passController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                hintText: 'ENTER PASSWORD HERE...',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            validator: (Value) {
                              if (Value!.isEmpty) {
                                return 'Please Enter Password First...';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (formData.emailController.text == 'a' &&
                                  formData.passController.text == 'b') {
                                Get.offAll(LeadForm(),
                                    transition: Transition.rightToLeftWithFade,
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
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Get.off(Signup(),
                                transition: Transition.downToUp,
                                duration: Duration(milliseconds: 500));
                          },
                          child: Text(
                            'DON\'T HAVE AN ACCOUNT',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
