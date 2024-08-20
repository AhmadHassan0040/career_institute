import 'package:career_institute/Modules/myDrawer.dart';
import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lead_Follow_UP extends StatelessWidget {
  const Lead_Follow_UP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'LEAD FOLLOW UP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(Login(), transition: Transition.rightToLeftWithFade);
              },
              icon: Icon(Icons.logout))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent])),
        ),
      ),
      drawer: myDrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.greenAccent])),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}