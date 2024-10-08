// ignore_for_file: must_be_immutable

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Modules/myAppBar.dart';
import 'package:career_institute/Modules/myDrawer.dart';
import 'package:career_institute/Pages/Lead%20Management/Tables/Lead_Follow_UP_Table.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Lead_Follow_UP extends StatefulWidget {
  Lead_Follow_UP({super.key});

  @override
  State<Lead_Follow_UP> createState() => _Lead_Follow_UPState();
}

class _Lead_Follow_UPState extends State<Lead_Follow_UP> {
  LeadFollowUPData leadFollowUPData = Get.put(LeadFollowUPData());
  String? viewMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey.shade900,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          viewMode = 'mob';
          return _mobileView();
        } else if (constraints.maxWidth >= 600 &&
            constraints.maxWidth <= 1024) {
          viewMode = 'tab';
          return _tabletView();
        } else {
          viewMode = 'win';
          return _windowView();
        }
      }),
    );
  }

  Widget _mobileView() {
    return _leadFollowUP();
  }

  Widget _tabletView() {
    return _leadFollowUP();
  }

  Widget _windowView() {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: 304,
          color: Colors.white,
          child: drawerData(),
        ),
        Container(
          width: _screenWidth - 304,
          color: Colors.blueGrey.shade900,
          child: _leadFollowUP(),
        ),
      ],
    );
  }

  Widget _leadFollowUP() {
    return Center(
      child: ListView(
        children: [
          myAppBar(title: 'LEAD\'S FOLLOW UP', mode: viewMode!),
          Stack(children: [
            Center(
              child: Container(
                width: 720,
                child: CupertinoSlidingSegmentedControl(
                    thumbColor: Colors.white,
                    backgroundColor: Colors.grey.shade900,
                    children: {
                      'todays': Text(
                        'TODAY\'s LEADS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: leadFollowUPData.leads == 'todays'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'pending': Text(
                        'PENDING LEADS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: leadFollowUPData.leads == 'pending'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    },
                    groupValue: leadFollowUPData.leads,
                    onValueChanged: (String? newValue) {
                      setState(() {
                        leadFollowUPData.leads = newValue!;
                      });
                    }),
              ),
            ),
            Center(
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: Center(child: _addLeadBtn()))),
          ]),
          SizedBox(height: 5),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 720,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(color: Colors.blue, width: 2)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 40,
                            child: Center(
                              child: Text('SR',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Center(
                              child: Text('NAME',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 300,
                            child: Center(
                              child: Text('PROGRAM',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Center(
                              child: Text('CONTACT',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 60,
                            child: Center(
                              child: Text('CAMPUS',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 70,
                            child: Center(
                              child: Text('ACTION',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(children: [
                      Container(
                        height: 30,
                        width: 720,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border(top: BorderSide(color: Colors.black26)),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: Center(
                          child: Text(
                            'No Data',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      _LeadsTable(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _addLeadBtn() {
    if (leadFollowUPData.leads == 'todays') {
      return _addTodays();
    } else {
      return _addPending();
    }
  }

  Widget _addTodays() {
    return IconButton(
        onPressed: () {
          leadFollowUPData.addTodaysLead({
            'Name': 'Testing Todays',
            'Program': 'Web Applications Development',
            'Contact': '0000000000',
            'Campus': 'CIFSD05',
          });
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ));
  }

  Widget _addPending() {
    return IconButton(
        onPressed: () {
          leadFollowUPData.addPendingLead({
            'Name': 'Testing Pending',
            'Program': 'Web Applications Development',
            'Contact': '0000000000',
            'Campus': 'CIFSD05',
          });
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ));
  }

  Widget _LeadsTable() {
    if (leadFollowUPData.leads == 'todays') {
      return _TodaysLeads();
    } else {
      return _PendingLeads();
    }
  }

  Widget _TodaysLeads() {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight,
      width: 720,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Center(
        child: Obx(
          () => ListView.builder(
              itemCount: leadFollowUPData.TodaysLeads.length,
              itemBuilder: (context, index) {
                final Map<String, String> lead =
                    leadFollowUPData.TodaysLeads[index];
                return FollowUPLeads(
                  Sr: index + 1,
                  Name: lead['Name'] ?? '',
                  Program: lead['Program'] ?? '',
                  Contact: lead['Contact'] ?? '',
                  Campus: lead['Campus'] ?? '',
                );
              }),
        ),
      ),
    );
  }

  Widget _PendingLeads() {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight,
      width: 720,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Center(
        child: Obx(
          () => ListView.builder(
              itemCount: leadFollowUPData.PendingLeads.length,
              itemBuilder: (context, index) {
                final Map<String, String> lead =
                    leadFollowUPData.PendingLeads[index];
                return FollowUPLeads(
                  Sr: index + 1,
                  Name: lead['Name'] ?? '',
                  Program: lead['Program'] ?? '',
                  Contact: lead['Contact'] ?? '',
                  Campus: lead['Campus'] ?? '',
                );
              }),
        ),
      ),
    );
  }
}
