// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  myDrawer({super.key});

  String currentUser = 'User Name';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade900,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25), topRight: Radius.circular(25))),
      child: Center(
          child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'lib/images/career institute indoor.jpg',
                color: Colors.blue,
                colorBlendMode: BlendMode.color,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey.shade900,
                          Colors.blue.shade900,
                          Colors.blue.shade900,
                          Colors.blueGrey.shade900,
                        ]),
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
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                      titleAlignment: ListTileTitleAlignment.bottom,
                      title: Text(
                        'WELCOME,\n    $currentUser',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'HOME PAGE',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            leading: Icon(
              Icons.account_box,
              color: Colors.white,
            ),
            title: Text(
              'ACCOUNT SETTINGS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              'SETTINGS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            leading: Icon(
              Icons.question_answer,
              color: Colors.white,
            ),
            title: Text(
              'FAQ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              'LOGOUT',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      )),
    );
  }
}
