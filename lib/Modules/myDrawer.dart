// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:career_institute/Pages/Dashboard.dart';
import 'package:career_institute/Pages/Lead%20Management/Create_Leads_Form.dart';
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
              bottomRight: Radius.circular(12), topRight: Radius.circular(12))),
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
                        onTap: () {
                          Get.offAll(Dashboard());
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Dashboard.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'DASHBOARD',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Lead Management.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'LEAD MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                            title: Text('Create New Lead'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.circle,
                              size: 10,
                              color: Colors.grey,
                            ),
                            title: Text('Load Follow-UP'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Website Leads'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Bulk Leads'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Today\'s Leads'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Successfully Registered'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Successfully Enrolled'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Not Interested'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Transferred Leads'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Leads in Pipeline'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('All Leads'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/RegistrationManagement.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'REGISTRATION MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Admission Management.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'ADMISSION MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Student Management.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'STUDENT MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/BatchTimeTable.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'BATCH & TIME TABLE',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Programs.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'PROGRAMMES',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Campuses.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'CAMPUSES',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/HumanResource.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'HUMAN RESOURCE',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/FinanceManagement.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'FINANCE MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/CertificateManagement.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'CERTIFICATE MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/UserManagement.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'USER MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
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
                                fontSize: 12,
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        onTap: () {
                          Get.offAll(Dashboard());
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Event Management.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'EVENT MANAGEMENT',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        onTap: () {
                          Get.offAll(Dashboard());
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Marketing.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'MARKETING',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Report.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'REPORT',
                          style: TextStyle(
                              fontSize: 14,
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
                            title: Text('Daily Business Report'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Daily Closing Report'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                            title: Text('Activity Report'),
                            titleTextStyle: TextStyle(
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                                fontSize: 12,
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        onTap: () {
                          Get.offAll(Dashboard());
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Website.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'WEBSITE',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        onTap: () {
                          Get.offAll(Dashboard());
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(
                          'lib/images/Website panel.jpeg',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          'WEBSITE ADMIN PANEL',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
