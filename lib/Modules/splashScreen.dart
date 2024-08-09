// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:career_institute/Pages/Leads_Form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after a delay
    Future.delayed(Duration(seconds: 3), () {
      Get.off(LeadForm(),
          transition: Transition.fade, duration: Duration(seconds: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: [
                FadeEffect(duration: Duration(seconds: 1)),
                MoveEffect()
              ],
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('lib/images/career institute.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Animate(effects: [
              FadeEffect(duration: Duration(seconds: 1)),
            ], child: Text('BUILD YOUR FUTUTRE WITH US')),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: LinearProgressIndicator(
                color: Colors.grey.shade900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
