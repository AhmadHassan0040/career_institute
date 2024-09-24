// ignore_for_file: prefer_const_constructors

import 'package:career_institute/Modules/splashScreen.dart';
import 'package:career_institute/Pages/Dashboard.dart';
import 'package:career_institute/Pages/Lead%20Management/Create_Leads_Form.dart';
import 'package:career_institute/Pages/Lead%20Management/Lead_Follow_UP.dart';

import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {

  //App Starts from here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Rajdhani'),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
