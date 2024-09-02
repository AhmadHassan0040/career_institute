// ignore_for_file: must_be_immutable

import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myAppBar extends StatefulWidget {
  String title;
  String mode;
  myAppBar({super.key, required this.title, required this.mode});

  @override
  State<myAppBar> createState() => _myAppBarState();
}

class _myAppBarState extends State<myAppBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (widget.mode == 'mob') {
        return _mobileAppBar();
      } else if (widget.mode == 'tab') {
        return _tabletAppBar();
      } else {
        return _windowAppBar();
      }
    });
  }

  _openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  Widget _mobileAppBar() {
    return Container(
      height: 75,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Colors.blueGrey.shade900),
      child: Center(
        child: ListTile(
          leading: IconButton(
              onPressed: () {
                _openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white)),
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          trailing: IconButton(
              onPressed: () {
                Get.offAll(Login(), transition: Transition.rightToLeftWithFade);
              },
              icon: Icon(Icons.logout, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _tabletAppBar() {
    return Container(
      height: 75,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Colors.blueGrey.shade900),
      child: Center(
        child: ListTile(
          leading: IconButton(
              onPressed: () {
                _openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white)),
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          trailing: IconButton(
              onPressed: () {
                Get.offAll(Login(), transition: Transition.rightToLeftWithFade);
              },
              icon: Icon(Icons.logout, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _windowAppBar() {
    return Container(
      height: 75,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Colors.blueGrey.shade900),
      child: Center(
        child: ListTile(
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          trailing: IconButton(
              onPressed: () {
                Get.offAll(Login(), transition: Transition.rightToLeftWithFade);
              },
              icon: Icon(Icons.logout, color: Colors.white)),
        ),
      ),
    );
  }
}
