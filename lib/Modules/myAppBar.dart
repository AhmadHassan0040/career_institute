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
            trailing: _moreMobileActions()),
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
          trailing: _moreWindowActions(),
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
            trailing: _moreWindowActions()),
      ),
    );
  }

  Widget _moreMobileActions() {
    return IconButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => _moreMobActions());
        },
        icon: Icon(Icons.more_vert, color: Colors.white));
  }

  Widget _moreWindowActions() {
    return IconButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => _moreActions());
        },
        icon: Icon(Icons.more_vert, color: Colors.white));
  }

  Widget _moreMobActions() {
    return Dialog(
      alignment: Alignment(1, -1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.blueGrey.shade900,
      child: Container(
        width: 600,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.list_alt,
                        color: Colors.white,
                      )),
                  Badge(
                      alignment: Alignment(0.5, -0.5),
                      label: Text('228'),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none,
                              color: Colors.white))),
                  IconButton(
                      onPressed: () {
                        Get.offAll(Login(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      icon: Icon(Icons.logout, color: Colors.white)),
                ],
              ),
              Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade900,
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _moreActions() {
    return Dialog(
      alignment: Alignment(1, -1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.blueGrey.shade900,
      child: Container(
        width: 600,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade900,
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.list_alt,
                        color: Colors.white,
                      )),
                  Badge(
                      alignment: Alignment(0.5, -0.5),
                      label: Text('228'),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none,
                              color: Colors.white))),
                  IconButton(
                      onPressed: () {
                        Get.offAll(Login(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      icon: Icon(Icons.logout, color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
