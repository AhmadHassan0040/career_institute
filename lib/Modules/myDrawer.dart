// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:career_institute/Startup_initial_Pages/login-or-signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myDrawer extends StatelessWidget {
  myDrawer({super.key});

  String currentUser = 'User Name';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0), topRight: Radius.circular(0))),
      child: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.greenAccent])),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade900,
                        offset: Offset(0, 5),
                        spreadRadius: 4,
                        blurRadius: 10)
                  ],
                  border: Border(
                      bottom: BorderSide(color: Colors.white),
                      top: BorderSide(color: Colors.white))),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                leading: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/images/career institute.jpg',
                        ),
                      )),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
                titleAlignment: ListTileTitleAlignment.bottom,
                title: Text(
                  '$currentUser',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Dashboard.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'DASHBOARD',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Lead Management.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'LEAD MANAGEMENT',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
