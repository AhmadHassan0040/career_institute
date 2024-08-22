// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Pages/Dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 5,
                  height: 50,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Animate(
                  effects: [
                    FadeEffect(),
                    SlideEffect(begin: Offset(-0.5, 0)),
                  ],
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('lib/images/career institute.jpg'))),
                  ),
                ),
                SizedBox(width: 20),
                Animate(
                  effects: [
                    FadeEffect(),
                    SlideEffect(begin: Offset(-0.5, 0)),
                  ],
                  child: Text(
                    'CAREER INSTITUTE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50)),
                          Text('Welcome back, login to your account'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: formData.emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(color: Colors.black)),
                        validator: (Value) {
                          if (Value!.isEmpty) {
                            return 'Please enter email first...';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

                          if (!emailRegex.hasMatch(Value)) {
                            return 'Please enter a valid email address.';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: formData.passController,
                        obscureText: _passwordObscure,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _passwordObscure = !_passwordObscure;
                                    _visibility = _passwordObscure
                                        ? Icon(Icons.remove_red_eye_outlined)
                                        : Icon(Icons.remove_red_eye);
                                  });
                                },
                                child: _visibility),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.black)),
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
                              formData.passController.text == '11111111') {
                            Get.offAll(() => Dashboard(),
                                transition: Transition.rightToLeftWithFade,
                                duration: Duration(seconds: 1));
                          }
                        }
                      },
                      child: Center(
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 3),
                                )
                              ],
                              color: Colors.blueGrey.shade900,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'VISIT OUR SOCIAL MEDIA',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue,
                    Colors.greenAccent
                  ]).createShader(bounds),
                  child: IconButton(
                      onPressed: () {
                        final url = Uri.parse(
                            'https://www.instagram.com/careerinstituteofficial/');
                        launchUrl(url, mode: LaunchMode.inAppWebView);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2))
                        ],
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue,
                    Colors.greenAccent
                  ]).createShader(bounds),
                  child: IconButton(
                      onPressed: () {
                        final url = Uri.parse(
                            'https://www.linkedin.com/company/careerinstituteofficial/');
                        launchUrl(url, mode: LaunchMode.inAppWebView);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2))
                        ],
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue,
                    Colors.greenAccent
                  ]).createShader(bounds),
                  child: IconButton(
                      onPressed: () {
                        final url = Uri.parse(
                            'https://www.facebook.com/careerinstituteofficial/');
                        launchUrl(url, mode: LaunchMode.externalApplication);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2))
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
