// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Pages/Dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// i used email: test@gmail.com and password: 11111111
// for navigational testing

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginData formData = Get.put(LoginData());

  bool _passwordObscure = true;
  bool _btnPressed = false;

  Icon _visibility = Icon(Icons.remove_red_eye_outlined);

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus to capture keyboard events when the screen is first shown
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _performLoginAction() {
    setState(() {
      _btnPressed = !_btnPressed;
      Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          _btnPressed = !_btnPressed;
          if (_formKey.currentState!.validate()) {
            if (formData.emailController.text == 'test@gmail.com' &&
                formData.passController.text == '11111111') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.white,
                  duration: Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  width: 300,
                  content: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                              colors: [Colors.blue, Colors.greenAccent])
                          .createShader(bounds),
                      child: Text(
                        'LOGIN SUCCESSFULL',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )));
              Get.offAll(() => Dashboard(),
                  transition: Transition.rightToLeftWithFade,
                  duration: Duration(seconds: 1));
            } else {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        child: Container(
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade900,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Invalid Credentials',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Enter correct email and password.',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ));
            }
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey.shade900,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _mobileView();
        } else if (constraints.maxWidth >= 600 &&
            constraints.maxWidth <= 1024) {
          return _tabletView();
        } else {
          return _windowView();
        }
      }),
    );
  }

  Widget _loginComponents() {
    return Column(
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
                        image: AssetImage('lib/images/career institute.jpg'))),
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
          child: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
            },
            child: Actions(
              actions: <Type, Action<Intent>>{
                ActivateIntent: CallbackAction<ActivateIntent>(
                  onInvoke: (Intent intent) => _performLoginAction(),
                ),
              },
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
                            prefixIcon:
                                Icon(Icons.email_outlined, color: Colors.black),
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
                            prefixIcon: Icon(Icons.key, color: Colors.black),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.black)),
                        validator: (Value) {
                          if (Value!.isEmpty) {
                            return 'Please enter password first...';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Focus(
                      focusNode: _focusNode,
                      autofocus: true,
                      child: GestureDetector(
                        onTap: () {
                          _performLoginAction();
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
                              child: _btnPressed
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 25),
                                        Text(
                                          'LOG IN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      ],
                                    )
                                  : Text(
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
                    ),
                  ],
                ),
              ),
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
              shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.blue, Colors.blue, Colors.greenAccent])
                  .createShader(bounds),
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
              shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.blue, Colors.blue, Colors.greenAccent])
                  .createShader(bounds),
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
              shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.blue, Colors.blue, Colors.greenAccent])
                  .createShader(bounds),
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
    );
  }

  Widget _mobileView() {
    return Center(
      child: SingleChildScrollView(child: _loginComponents()),
    );
  }

  Widget _tabletView() {
    return Center(
      child: Container(
          alignment: Alignment.center, width: 400, child: _mobileView()),
    );
  }

  Widget _windowView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset('lib/images/loginImage.png'),
        ),
        _tabletView(),
      ],
    );
  }
}
