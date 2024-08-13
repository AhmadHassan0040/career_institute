// ignore_for_file: prefer_const_constructors

import 'package:career_institute/Modules/splashScreen.dart';
import 'package:career_institute/Pages/Leads_Form.dart';
// import 'package:career_institute/Pages/Leads_Form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LeadForm(),
    );
  }
}
