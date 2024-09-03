import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Modules/myAppBar.dart';
import 'package:career_institute/Modules/myDrawer.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardData dashboardData = DashboardData();
  String? viewMode;

  Future<void> _pageRefresh() async {
    setState(() {
      Get.offAll(() => Dashboard(), transition: Transition.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
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
    return Container(
      color: Colors.blueGrey.shade900,
      child: Center(
        child: RefreshIndicator(
          backgroundColor: Colors.blueGrey.shade900,
          color: Colors.greenAccent,
          onRefresh: _pageRefresh,
          child: ListView(
            children: [
              myAppBar(title: 'DASHBOARD', mode: viewMode!),
              Container(
                height: 70,
                color: Colors.blueGrey.shade900,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        dashboardData.selectedPeriod,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                                colors: [Colors.blue, Colors.greenAccent])
                            .createShader(bounds),
                        child: Text('\$${dashboardData.monthlyIncome}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                      Text(
                        'TOTAL INCOME THIS MONTH',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                  ),
                  child: _buildGraph()),
              Container(
                color: Colors.blueGrey.shade900,
                child: CupertinoSlidingSegmentedControl(
                    thumbColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    children: {
                      'WEEKLY GRAPH': Text(
                        'WEEKLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedPeriod == 'WEEKLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'MONTHLY GRAPH': Text(
                        'MONTHLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedPeriod == 'MONTHLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'YEARLY GRAPH': Text(
                        'YEARLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedPeriod == 'YEARLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    },
                    groupValue: dashboardData.selectedPeriod,
                    onValueChanged: (String? newValue) {
                      setState(() {
                        dashboardData.selectedPeriod = newValue!;
                      });
                    }),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.blueGrey.shade900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('Registration',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('1200000',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 15,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 15, right: 30),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('Admission',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('1600000',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 15,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 30, right: 35),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('Recovery',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('1801000',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _yellowChart(),
                  _greenChart(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _purpleChart(),
                  _redChart(),
                ],
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.blueGrey.shade900,
                child: CupertinoSlidingSegmentedControl(
                    thumbColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    children: {
                      'LEADS': Text(
                        'THIS MONTH\'s LEAD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedGraph == 'LEADS'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'ADMISSIONS': Text(
                        'THIS MONTH\'s ADMISSION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedGraph == 'ADMISSIONS'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    },
                    groupValue: dashboardData.selectedGraph,
                    onValueChanged: (String? newValue) {
                      setState(() {
                        dashboardData.selectedGraph = newValue!;
                      });
                    }),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: 250,
                decoration: BoxDecoration(color: Colors.blueGrey.shade900),
                child: _buildLeadOrAdmission(),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(top: BorderSide(color: Colors.blue, width: 2)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 5, left: 10, right: 1),
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.greenAccent
                                    ]).createShader(bounds),
                                child: Text(
                                  'Daily Activity |',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              'Each Campus',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: _printDoc, icon: Icon(Icons.print))
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Campus Code',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                          Text('Leads',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                          Text('Admissions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                          Text('Collection',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                        ]),
                    Divider(height: 5),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                ),
                child: _buildTable(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabletView() {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Center(
        child: RefreshIndicator(
          backgroundColor: Colors.blueGrey.shade900,
          color: Colors.greenAccent,
          onRefresh: _pageRefresh,
          child: ListView(
            children: [
              myAppBar(title: 'DASHBOARD', mode: viewMode!),
              Container(
                height: 70,
                color: Colors.blueGrey.shade900,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        dashboardData.selectedPeriod,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                                colors: [Colors.blue, Colors.greenAccent])
                            .createShader(bounds),
                        child: Text('\$${dashboardData.monthlyIncome}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                      Text(
                        'TOTAL INCOME THIS MONTH',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                  ),
                  child: _buildGraph()),
              Container(
                color: Colors.blueGrey.shade900,
                child: CupertinoSlidingSegmentedControl(
                    thumbColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    children: {
                      'WEEKLY GRAPH': Text(
                        'WEEKLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedPeriod == 'WEEKLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'MONTHLY GRAPH': Text(
                        'MONTHLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedPeriod == 'MONTHLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'YEARLY GRAPH': Text(
                        'YEARLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dashboardData.selectedPeriod == 'YEARLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    },
                    groupValue: dashboardData.selectedPeriod,
                    onValueChanged: (String? newValue) {
                      setState(() {
                        dashboardData.selectedPeriod = newValue!;
                      });
                    }),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.blueGrey.shade900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('Registration',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('1200000',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 15,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 15, right: 30),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('Admission',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('1600000',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 15,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 30, right: 35),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('Recovery',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('1801000',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _yellowChart(),
                  _greenChart(),
                  _purpleChart(),
                  _redChart(),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.blueGrey.shade900),
                    child: _buildLeadsGraph(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.blueGrey.shade900),
                    child: _buildAdmissionsGraph(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(top: BorderSide(color: Colors.blue, width: 2)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 5, left: 10, right: 1),
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.greenAccent
                                    ]).createShader(bounds),
                                child: Text(
                                  'Daily Activity |',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              'Each Campus',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: _printDoc, icon: Icon(Icons.print))
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Campus Code',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                          Text('Leads',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                          Text('Admissions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                          Text('Collection',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700)),
                        ]),
                    Divider(height: 5),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: 385,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                ),
                child: _buildTabletViewTable(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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
          child: Center(
            child: RefreshIndicator(
              backgroundColor: Colors.blueGrey.shade900,
              color: Colors.greenAccent,
              onRefresh: _pageRefresh,
              child: ListView(
                children: [
                  myAppBar(title: 'DASHBOARD', mode: viewMode!),
                  Container(
                    height: 70,
                    color: Colors.blueGrey.shade900,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            dashboardData.selectedPeriod,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.blue, Colors.greenAccent])
                                .createShader(bounds),
                            child: Text('\$${dashboardData.monthlyIncome}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                          ),
                          Text(
                            'TOTAL INCOME THIS MONTH',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 400,
                              width: 570,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade900,
                              ),
                              child: _buildWindowGraph()),
                          Container(
                            width: 570,
                            color: Colors.blueGrey.shade900,
                            child: CupertinoSlidingSegmentedControl(
                                thumbColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                children: {
                                  'WEEKLY GRAPH': Text(
                                    'WEEKLY',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: dashboardData.selectedPeriod ==
                                              'WEEKLY GRAPH'
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  'MONTHLY GRAPH': Text(
                                    'MONTHLY',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: dashboardData.selectedPeriod ==
                                              'MONTHLY GRAPH'
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  'YEARLY GRAPH': Text(
                                    'YEARLY',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: dashboardData.selectedPeriod ==
                                              'YEARLY GRAPH'
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                },
                                groupValue: dashboardData.selectedPeriod,
                                onValueChanged: (String? newValue) {
                                  setState(() {
                                    dashboardData.selectedPeriod = newValue!;
                                  });
                                }),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _yellowChart(),
                          SizedBox(height: 20),
                          _greenChart(),
                          SizedBox(height: 20),
                          _purpleChart(),
                          SizedBox(height: 20),
                          _redChart(),
                          SizedBox(height: 10),
                        ],
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 100,
                      color: Colors.blueGrey.shade900,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.greenAccent
                                    ]).createShader(bounds),
                                child: Text('Registration',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Text('1200000',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Container(
                            width: 0.5,
                            height: 15,
                            color: Colors.white,
                            margin: EdgeInsets.only(left: 15, right: 30),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.greenAccent
                                    ]).createShader(bounds),
                                child: Text('Admission',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Text('1600000',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Container(
                            width: 0.5,
                            height: 15,
                            color: Colors.white,
                            margin: EdgeInsets.only(left: 30, right: 35),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.greenAccent
                                    ]).createShader(bounds),
                                child: Text('Recovery',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Text('1801000',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        height: 260,
                        width: 360,
                        decoration:
                            BoxDecoration(color: Colors.blueGrey.shade900),
                        child: _buildLeadsGraph(),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        height: 260,
                        width: 360,
                        decoration:
                            BoxDecoration(color: Colors.blueGrey.shade900),
                        child: _buildAdmissionsGraph(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(color: Colors.blue, width: 2)),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 5, left: 10, right: 1),
                                  child: ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.greenAccent
                                        ]).createShader(bounds),
                                    child: Text(
                                      'Daily Activity |',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Each Campus',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: _printDoc, icon: Icon(Icons.print))
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Campus Code',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700)),
                              Text('Leads',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700)),
                              Text('Admissions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700)),
                              Text('Collection',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700)),
                            ]),
                        Divider(height: 5),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 385,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                    ),
                    child: _buildTabletViewTable(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGraph() {
    switch (dashboardData.selectedPeriod) {
      case 'WEEKLY GRAPH':
        return _buildWeeklyGraph();
      case 'MONTHLY GRAPH':
        return _buildMonthlyGraph();
      case 'YEARLY GRAPH':
        return _buildYearlyGraph();
      default:
        return _buildWeeklyGraph();
    }
  }

  Widget _buildWindowGraph() {
    switch (dashboardData.selectedPeriod) {
      case 'WEEKLY GRAPH':
        return _buildWeeklyWindowGraph();
      case 'MONTHLY GRAPH':
        return _buildMonthlyWindowGraph();
      case 'YEARLY GRAPH':
        return _buildYearlyWindowGraph();
      default:
        return _buildWeeklyWindowGraph();
    }
  }

  Widget _buildWeeklyGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 42,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.blueGrey.shade900,
        minY: 0,
        maxY: 300,
        lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        )),
        lineBarsData: [
          LineChartBarData(
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.2),
                    Colors.greenAccent.withOpacity(0.15),
                    Colors.greenAccent.withOpacity(0.1),
                    Colors.greenAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(-1, dashboardData.mon.toDouble()),
              FlSpot(0, dashboardData.mon.toDouble()),
              FlSpot(1, dashboardData.tue.toDouble()),
              FlSpot(2, dashboardData.wed.toDouble()),
              FlSpot(3, dashboardData.thu.toDouble()),
              FlSpot(4, dashboardData.fri.toDouble()),
              FlSpot(5, dashboardData.sat.toDouble()),
              FlSpot(6, dashboardData.sun.toDouble()),
              FlSpot(7, dashboardData.sun.toDouble()),
            ],
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('MON',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('TUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WED',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('THU',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 4:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('FRI',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 5:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('SAT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 6:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('SUN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );

                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _buildWeeklyWindowGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 42,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.blueGrey.shade900,
        minY: 0,
        maxY: 300,
        lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        )),
        lineBarsData: [
          LineChartBarData(show: false, spots: [
            FlSpot(-1, dashboardData.mon.toDouble()),
            FlSpot(7, dashboardData.sun.toDouble()),
          ]),
          LineChartBarData(
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.2),
                    Colors.greenAccent.withOpacity(0.15),
                    Colors.greenAccent.withOpacity(0.1),
                    Colors.greenAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(0, dashboardData.mon.toDouble()),
              FlSpot(1, dashboardData.tue.toDouble()),
              FlSpot(2, dashboardData.wed.toDouble()),
              FlSpot(3, dashboardData.thu.toDouble()),
              FlSpot(4, dashboardData.fri.toDouble()),
              FlSpot(5, dashboardData.sat.toDouble()),
              FlSpot(6, dashboardData.sun.toDouble()),
            ],
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('MON',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('TUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WED',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('THU',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 4:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('FRI',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 5:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('SAT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 6:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('SUN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );

                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _buildMonthlyGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 42,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.blueGrey.shade900,
        minY: 0,
        maxY: 300,
        lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        )),
        lineBarsData: [
          LineChartBarData(
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.2),
                    Colors.greenAccent.withOpacity(0.15),
                    Colors.greenAccent.withOpacity(0.1),
                    Colors.greenAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(-1, dashboardData.week1.toDouble()),
              FlSpot(0, dashboardData.week1.toDouble()),
              FlSpot(1, dashboardData.week2.toDouble()),
              FlSpot(2, dashboardData.week3.toDouble()),
              FlSpot(3, dashboardData.week4.toDouble()),
              FlSpot(4, dashboardData.week4.toDouble()),
            ],
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK1',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK2',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK3',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK4',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );

                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _buildMonthlyWindowGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 42,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.blueGrey.shade900,
        minY: 0,
        maxY: 300,
        lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        )),
        lineBarsData: [
          LineChartBarData(show: false, spots: [
            FlSpot(-1, dashboardData.week1.toDouble()),
            FlSpot(4, dashboardData.week4.toDouble()),
          ]),
          LineChartBarData(
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.2),
                    Colors.greenAccent.withOpacity(0.15),
                    Colors.greenAccent.withOpacity(0.1),
                    Colors.greenAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(0, dashboardData.week1.toDouble()),
              FlSpot(1, dashboardData.week2.toDouble()),
              FlSpot(2, dashboardData.week3.toDouble()),
              FlSpot(3, dashboardData.week4.toDouble()),
            ],
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK1',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK2',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK3',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('WEEK4',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    );

                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _buildYearlyGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 42,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.blueGrey.shade900,
        minY: 0,
        maxY: 300,
        lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        )),
        lineBarsData: [
          LineChartBarData(
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.2),
                    Colors.greenAccent.withOpacity(0.15),
                    Colors.greenAccent.withOpacity(0.1),
                    Colors.greenAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(-1, dashboardData.jan.toDouble()),
              FlSpot(0, dashboardData.jan.toDouble()),
              FlSpot(1, dashboardData.feb.toDouble()),
              FlSpot(2, dashboardData.mar.toDouble()),
              FlSpot(3, dashboardData.apr.toDouble()),
              FlSpot(4, dashboardData.may.toDouble()),
              FlSpot(5, dashboardData.jun.toDouble()),
              FlSpot(6, dashboardData.jul.toDouble()),
              FlSpot(7, dashboardData.aug.toDouble()),
              FlSpot(8, dashboardData.sep.toDouble()),
              FlSpot(9, dashboardData.oct.toDouble()),
              FlSpot(10, dashboardData.nov.toDouble()),
              FlSpot(11, dashboardData.dec.toDouble()),
              FlSpot(12, dashboardData.dec.toDouble()),
            ],
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('JAN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('FEB',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('MAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('APR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 4:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('MAY',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 5:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('JUN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 6:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('JUL',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 7:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('AUG',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 8:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('SEP',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 9:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('OCT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 10:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('NOV',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 11:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('DEC',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );

                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _buildYearlyWindowGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 42,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.white24,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        backgroundColor: Colors.blueGrey.shade900,
        minY: 0,
        maxY: 300,
        lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        )),
        lineBarsData: [
          LineChartBarData(show: false, spots: [
            FlSpot(-1, dashboardData.jan.toDouble()),
            FlSpot(12, dashboardData.dec.toDouble()),
          ]),
          LineChartBarData(
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.2),
                    Colors.greenAccent.withOpacity(0.15),
                    Colors.greenAccent.withOpacity(0.1),
                    Colors.greenAccent.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(0, dashboardData.jan.toDouble()),
              FlSpot(1, dashboardData.feb.toDouble()),
              FlSpot(2, dashboardData.mar.toDouble()),
              FlSpot(3, dashboardData.apr.toDouble()),
              FlSpot(4, dashboardData.may.toDouble()),
              FlSpot(5, dashboardData.jun.toDouble()),
              FlSpot(6, dashboardData.jul.toDouble()),
              FlSpot(7, dashboardData.aug.toDouble()),
              FlSpot(8, dashboardData.sep.toDouble()),
              FlSpot(9, dashboardData.oct.toDouble()),
              FlSpot(10, dashboardData.nov.toDouble()),
              FlSpot(11, dashboardData.dec.toDouble()),
            ],
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('JAN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('FEB',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('MAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('APR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 4:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('MAY',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 5:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('JUN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 6:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('JUL',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 7:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('AUG',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 8:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('SEP',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 9:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('OCT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 10:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('NOV',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );
                  case 11:
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Text('DEC',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    );

                  default:
                    return const Text('');
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _yellowChart() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.yellow.shade600,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 4,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: LineChart(LineChartData(
              gridData: FlGridData(
                drawVerticalLine: true,
                horizontalInterval: 35,
                verticalInterval: 0.5,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              minY: 0,
              maxY: 300,
              lineBarsData: [
                LineChartBarData(
                    belowBarData:
                        BarAreaData(color: Colors.yellow.shade700, show: true),
                    isCurved: false,
                    dotData: FlDotData(show: false),
                    color: Colors.yellow.shade700,
                    spots: [
                      FlSpot(0, 10),
                      FlSpot(1, 50),
                      FlSpot(3, 40),
                      FlSpot(4, 150),
                      FlSpot(5, 270),
                      FlSpot(6, 100),
                    ])
              ])),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('0',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Text('Today Leads',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_upward, color: Colors.white, size: 20),
              Text('15%',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ],
      )
    ]);
  }

  Widget _greenChart() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 4,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: LineChart(LineChartData(
              gridData: FlGridData(
                drawVerticalLine: true,
                horizontalInterval: 35,
                verticalInterval: 0.5,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              minY: 0,
              maxY: 300,
              lineBarsData: [
                LineChartBarData(
                    belowBarData:
                        BarAreaData(color: Colors.green.shade700, show: true),
                    isCurved: false,
                    dotData: FlDotData(show: false),
                    color: Colors.green.shade700,
                    spots: [
                      FlSpot(0, 100),
                      FlSpot(1, 50),
                      FlSpot(3, 140),
                      FlSpot(4, 150),
                      FlSpot(5, 70),
                      FlSpot(6, 150),
                    ])
              ])),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('2298',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Text('Current Students',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_downward, color: Colors.white, size: 20),
              Text('11%',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ],
      )
    ]);
  }

  Widget _purpleChart() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.purple.shade300,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 4,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: LineChart(LineChartData(
              gridData: FlGridData(
                drawVerticalLine: true,
                horizontalInterval: 35,
                verticalInterval: 0.5,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              minY: 0,
              maxY: 300,
              lineBarsData: [
                LineChartBarData(
                    belowBarData:
                        BarAreaData(color: Colors.purple.shade700, show: true),
                    isCurved: false,
                    dotData: FlDotData(show: false),
                    color: Colors.purple.shade700,
                    spots: [
                      FlSpot(0, 20),
                      FlSpot(1, 50),
                      FlSpot(3, 140),
                      FlSpot(4, 50),
                      FlSpot(5, 70),
                      FlSpot(6, 170),
                    ])
              ])),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1058300',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Text('Monthly Collection',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_downward, color: Colors.white, size: 20),
              Text('5%',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ],
      )
    ]);
  }

  Widget _redChart() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red.shade300,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 4,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: LineChart(LineChartData(
              gridData: FlGridData(
                drawVerticalLine: true,
                horizontalInterval: 35,
                verticalInterval: 0.5,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              minY: 0,
              maxY: 300,
              lineBarsData: [
                LineChartBarData(
                    belowBarData:
                        BarAreaData(color: Colors.red.shade700, show: true),
                    isCurved: false,
                    dotData: FlDotData(show: false),
                    color: Colors.red.shade700,
                    spots: [
                      FlSpot(0, 80),
                      FlSpot(1, 150),
                      FlSpot(3, 140),
                      FlSpot(4, 50),
                      FlSpot(5, 20),
                      FlSpot(6, 50),
                    ])
              ])),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('8215160',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Text('Pending Recovery',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_upward, color: Colors.white, size: 20),
              Text('84%',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          )
        ],
      )
    ]);
  }

  Widget _buildLeadOrAdmission() {
    switch (dashboardData.selectedGraph) {
      case 'LEADS':
        return _buildLeadsGraph();
      case 'ADMISSIONS':
        return _buildAdmissionsGraph();

      default:
        return _buildAdmissionsGraph();
    }
  }

  Widget _buildLeadsGraph() {
    return BarChart(BarChartData(
      minY: 0,
      maxY: 30,
      barGroups: [
        BarChartGroupData(x: 1, barRods: [
          BarChartRodData(
              toY: 25,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 2, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 3, barRods: [
          BarChartRodData(
              toY: 14,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 4, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 5, barRods: [
          BarChartRodData(
              toY: 3,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 6, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 7, barRods: [
          BarChartRodData(
              toY: 22,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 8, barRods: [
          BarChartRodData(
              toY: 27,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 9, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 10, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 11, barRods: [
          BarChartRodData(
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 12, barRods: [
          BarChartRodData(
              toY: 9,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 13, barRods: [
          BarChartRodData(
              toY: 6,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 14, barRods: [
          BarChartRodData(
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 15, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 16, barRods: [
          BarChartRodData(
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 17, barRods: [
          BarChartRodData(
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 18, barRods: [
          BarChartRodData(
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
      ],
      barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.toInt().toString(),
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          )),
      backgroundColor: Colors.grey.shade900,
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text(
            'Number of Leads',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) {
              // Define your string labels here
              String text;
              switch (value.toInt()) {
                case 1:
                  text = "OMT";
                  break;
                case 2:
                  text = "WPD";
                  break;
                case 3:
                  text = "GRD";
                  break;
                case 4:
                  text = "UXD";
                  break;
                case 5:
                  text = "LAR";
                  break;
                case 6:
                  text = "VUE";
                  break;
                case 7:
                  text = "PHP";
                  break;
                case 8:
                  text = "SEO";
                  break;
                case 9:
                  text = "IOS";
                  break;
                case 10:
                  text = "FLT";
                  break;
                case 11:
                  text = "CAD";
                  break;
                case 12:
                  text = "SPE";
                  break;
                case 13:
                  text = "IEL";
                  break;
                case 14:
                  text = "STE";
                  break;
                case 15:
                  text = "AVA";
                  break;
                case 16:
                  text = "DBA";
                  break;
                case 17:
                  text = "CNA";
                  break;
                case 18:
                  text = "SHY";
                  break;
                default:
                  text = "";
                  break;
              }
              return Text(
                text,
                style: TextStyle(
                    color: Colors.white, // Customize the label color here
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
          border: Border(
              top: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      gridData: FlGridData(show: true),
    ));
  }

  Widget _buildAdmissionsGraph() {
    return BarChart(BarChartData(
      minY: 0,
      maxY: 26,
      barGroups: [
        BarChartGroupData(x: 1, barRods: [
          BarChartRodData(
              width: 15,
              toY: 23,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 2, barRods: [
          BarChartRodData(
              width: 15,
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 3, barRods: [
          BarChartRodData(
              width: 15,
              toY: 10,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 4, barRods: [
          BarChartRodData(
              width: 15,
              toY: 20,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 5, barRods: [
          BarChartRodData(
              width: 15,
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 6, barRods: [
          BarChartRodData(
              width: 15,
              toY: 1,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
        BarChartGroupData(x: 7, barRods: [
          BarChartRodData(
              width: 15,
              toY: 2,
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.greenAccent],
                  begin: Alignment(1, 0),
                  end: Alignment(0, -1)))
        ]),
      ],
      barTouchData: BarTouchData(touchTooltipData: BarTouchTooltipData(
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            rod.toY.toInt().toString(),
            TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      )),
      backgroundColor: Colors.grey.shade900,
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text(
            'Number of Admissions',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) {
              String text;
              switch (value.toInt()) {
                case 1:
                  text = "OMT";
                  break;
                case 2:
                  text = "GRD";
                  break;
                case 3:
                  text = "PHP";
                  break;
                case 4:
                  text = "SEO";
                  break;
                case 5:
                  text = "FLT";
                  break;
                case 6:
                  text = "SPE";
                  break;
                case 7:
                  text = "PYT";
                  break;
                default:
                  text = "";
                  break;
              }
              return Text(
                text,
                style: TextStyle(
                    color: Colors.white, // Customize the label color here
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
          border: Border(
              top: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      gridData: FlGridData(show: true),
    ));
  }

  Widget _dailyActivityTable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIFSD01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIFSD02',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIFSD03',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIFSD04',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIFSD05',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CISWL01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIRYK01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CISGD01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CILHR01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CILHE01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'CIOKR01',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
              Container(
                height: 25,
                width: 80,
                child: Center(
                  child: Text('0'),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 5),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: Colors.greenAccent.shade100),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.greenAccent]),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'TOTAL',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 80,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 80,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 80,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTable() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: SingleChildScrollView(child: _dailyActivityTable()),
    );
  }

  Widget _buildTabletViewTable() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: _dailyActivityTable(),
    );
  }

  Future<void> _printDoc() async {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4, // Set page format to A4
        build: (pw.Context context) {
          // Build printable content (e.g., text)
          return pw.Center(
            child: pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border(
                      top: pw.BorderSide(color: PdfColors.blue, width: 2))),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 5.0, bottom: 5, left: 10, right: 1),
                        child: pw.Text(
                          'Daily Activity |',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.black),
                        ),
                      ),
                      pw.Text(
                        'Each Campus',
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text('Campus Code',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey700)),
                        pw.Text('Leads',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey700)),
                        pw.Text('Admissions',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey700)),
                        pw.Text('Collection',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey700)),
                      ]),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIFSD01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIFSD02',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIFSD03',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIFSD04',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIFSD05',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CISWL01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIRYK01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CISGD01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CILHR01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CILHE01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Container(
                          height: 25,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              gradient: pw.LinearGradient(colors: [
                                PdfColors.blue,
                                PdfColors.greenAccent
                              ]),
                              borderRadius: pw.BorderRadius.circular(5)),
                          child: pw.Center(
                            child: pw.Text(
                              'CIOKR01',
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                        pw.Container(
                          height: 25,
                          width: 80,
                          child: pw.Center(
                            child: pw.Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Divider(height: 5),
                  pw.Container(
                    padding: pw.EdgeInsets.symmetric(vertical: 10),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.only(
                            bottomLeft: pw.Radius.circular(5),
                            bottomRight: pw.Radius.circular(5)),
                        color: PdfColors.greenAccent100),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 12.0),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                        children: [
                          pw.Container(
                            height: 25,
                            width: 80,
                            decoration: pw.BoxDecoration(
                                gradient: pw.LinearGradient(colors: [
                                  PdfColors.blue,
                                  PdfColors.greenAccent
                                ]),
                                borderRadius: pw.BorderRadius.circular(5)),
                            child: pw.Center(
                              child: pw.Text(
                                'TOTAL',
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                          pw.Container(
                            height: 25,
                            width: 80,
                            child: pw.Center(
                              child: pw.Text(
                                '0',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                          pw.Container(
                            height: 25,
                            width: 80,
                            child: pw.Center(
                              child: pw.Text(
                                '0',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                          pw.Container(
                            height: 25,
                            width: 80,
                            child: pw.Center(
                              child: pw.Text(
                                '0',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    // Print the document
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }
}
