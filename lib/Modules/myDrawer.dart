// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:career_institute/Pages/Dashboard.dart';
import 'package:career_institute/Pages/Lead%20Management/All_Leads.dart';
import 'package:career_institute/Pages/Lead%20Management/Create_Leads_Form.dart';
import 'package:career_institute/Pages/Lead%20Management/Lead_Follow_UP.dart';
import 'package:career_institute/Pages/Lead%20Management/Leads_in_Pipeline.dart';
import 'package:career_institute/Pages/Lead%20Management/Not_Interested.dart';
import 'package:career_institute/Pages/Lead%20Management/Successfully_Enrolled.dart';
import 'package:career_institute/Pages/Lead%20Management/Successfully_Registered.dart';
import 'package:career_institute/Pages/Lead%20Management/Todays_Leads.dart';
import 'package:career_institute/Pages/Lead%20Management/Transferred_Leads.dart';
import 'package:career_institute/Pages/Lead%20Management/Website_Leads.dart';
import 'package:career_institute/Startup_initial_Pages/loginPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myDrawer extends StatelessWidget {
  myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12), topRight: Radius.circular(12))),
      child: drawerData(),
    );
  }
}

class drawerData extends StatelessWidget {
  const drawerData({super.key});

  @override
  Widget build(BuildContext context) {
    return _drawerList();
  }

  Widget _drawerList() {
    String currentUser = 'User Name';
    return Center(
        child: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    onTap: () {
                      Get.offAll(() => Dashboard(),
                          transition: Transition.rightToLeftWithFade);
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Dashboard.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'DASHBOARD',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Lead Management.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'LEAD MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.offAll(LeadForm(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Create New Lead'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(() => Lead_Follow_UP(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Lead\'s Follow-UP'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(() => Website_Leads(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Website Leads'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(Todays_Leads(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Today\'s Leads'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(Successfully_Registered(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Successfully Registered'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(Successfully_Enrolled(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Successfully Enrolled'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(Not_Interested(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Not Interested'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(Transferred_Leads(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Transferred Leads'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(Leads_Pipeline(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Leads in Pipeline'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(All_Leads(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Leads'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/RegistrationManagement.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'REGISTRATION MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Today Registrations'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Current Month Registrations'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Current Year Registrations'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Registrations'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Admission Management.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'ADMISSION MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Today Admission'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Current Month Admission'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Current Year Admission'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Admission'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Student Management.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'STUDENT MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Current Student'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Attendance'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Freeze Students'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Concluded Students'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Not Completed'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Suspended Students'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/BatchTimeTable.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'BATCH & TIME TABLE',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.offAll(LeadForm());
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Create Batch'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Upcomming'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Recently Started'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('In Progress'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Recently Ended'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Completed'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Suspended Batches'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Batches'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Manage Time Table'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Programs.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'PROGRAMMES',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Create Program'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Limit Management'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('On Going'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Suspended'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Programmes'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Campuses.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'CAMPUSES',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Create Campuses'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Campuses'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Suspended'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/HumanResource.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'HUMAN RESOURCE',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Employees'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/FinanceManagement.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'FINANCE MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Add Expense'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Add Expense Type'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Utility Bills'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Payroll'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Supplier & Payee'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('All Expense'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/CertificateManagement.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'CERTIFICATE MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Pending For Approval'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('On Printing'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Ready To Collect'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Delivered'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/UserManagement.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'USER MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Add User'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Manage User'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    onTap: () {
                      Get.offAll(Dashboard());
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Event Management.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'EVENT MANAGEMENT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    onTap: () {
                      Get.offAll(Dashboard());
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Marketing.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'MARKETING',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ExpansionTile(
                    expansionAnimationStyle:
                        AnimationStyle(curve: Curves.easeInOut),
                    tilePadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Report.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'REPORT',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Daily Closing Report'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Activity Report'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Admission Report'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Recovery Report'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        title: Text('Manage Event'),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.red])),
                          child: Center(
                              child: Text(
                            '99+',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    onTap: () {
                      Get.offAll(Dashboard());
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Website.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'WEBSITE',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    onTap: () {
                      Get.offAll(Dashboard());
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    leading: Image.asset(
                      'lib/images/Website panel.jpeg',
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      'WEBSITE ADMIN PANEL',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      offset: Offset(0, 5),
                      spreadRadius: 4,
                      blurRadius: 10)
                ],
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: ExpansionTile(
              expansionAnimationStyle: AnimationStyle(curve: Curves.easeInOut),
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              tilePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
              title: Text(
                '$currentUser',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(0, 1),
                                  colors: [
                                    Color.fromARGB(255, 33, 51, 243),
                                    Color.fromARGB(255, 13, 30, 161)
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/user-profile.png')),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('Adeel Javaid',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              Text('Super Admin',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8)),
                            ],
                          ),
                        ),
                        Container(
                          width: 184,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User Profile',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('Email',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text('hasan.hasanf80@gmail.com',
                                          style: TextStyle(fontSize: 9)),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text('Campus',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text('All',
                                          style: TextStyle(fontSize: 9)),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text('Created At',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text('2022-08-06 00:00:17',
                                          style: TextStyle(fontSize: 9)),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text('Remarks',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text('Updating Password to PPK',
                                          style: TextStyle(fontSize: 8)),
                                    )
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: GestureDetector(
                    onTap: () {
                      Get.offAll(() => Login(),
                          transition: Transition.rightToLeftWithFade);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0, 0.2),
                              colors: [
                                Color.fromARGB(255, 33, 51, 243),
                                Color.fromARGB(255, 13, 30, 161)
                              ]),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 2,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
