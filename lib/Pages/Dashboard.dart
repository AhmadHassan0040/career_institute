import 'package:career_institute/Modules/myDrawer.dart';
import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _selectedPeriod = 'WEEKLY GRAPH';

  //Weekly
  int mon = 130;
  int tue = 130;
  int wed = 180;
  int thu = 175;
  int fri = 200;
  int sat = 170;
  int sun = 250;

  //Monthly
  int week1 = 150;
  int week2 = 175;
  int week3 = 190;
  int week4 = 220;

  //Yearly
  int jan = 120;
  int feb = 140;
  int mar = 180;
  int apr = 170;
  int may = 200;
  int jun = 220;
  int jul = 250;
  int aug = 190;
  int sep = 230;
  int oct = 210;
  int nov = 180;
  int dec = 240;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'DASHBOARD',
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
        backgroundColor: Colors.blueGrey.shade900,
      ),
      drawer: myDrawer(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              Container(
                height: 70,
                color: Colors.blueGrey.shade900,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        _selectedPeriod,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                                colors: [Colors.blue, Colors.greenAccent])
                            .createShader(bounds),
                        child: Text('\$1500',
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
                          color: _selectedPeriod == 'WEEKLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'MONTHLY GRAPH': Text(
                        'MONTHLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedPeriod == 'MONTHLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      'YEARLY GRAPH': Text(
                        'YEARLY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedPeriod == 'YEARLY GRAPH'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    },
                    groupValue: _selectedPeriod,
                    onValueChanged: (String? newValue) {
                      setState(() {
                        _selectedPeriod = newValue!;
                      });
                    }),
              ),
              Container(
                  color: Colors.blueGrey.shade900,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent])
                                  .createShader(bounds),
                              child: Text('Registration',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Text('1200000',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent])
                                  .createShader(bounds),
                              child: Text('Admission',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text('1600000',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent])
                                  .createShader(bounds),
                              child: Text('Recovery',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35.0),
                              child: Text('1801000',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGraph() {
    switch (_selectedPeriod) {
      case 'WEEKLY GRAPH':
        return _buildWeeklyGraph();
      case 'MONTHLY GRAPH':
        return _buildMonthlyGraph();
      case 'YEARLY GRAPH':
        return _buildYearlyGraph();
      default:
        return _buildWeeklyGraph(); // Default to weekly graph if none selected
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
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.2),
                  Colors.greenAccent.withOpacity(0.2)
                ])),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(-1, mon.toDouble()),
              FlSpot(0, mon.toDouble()),
              FlSpot(1, tue.toDouble()),
              FlSpot(2, wed.toDouble()),
              FlSpot(3, thu.toDouble()),
              FlSpot(4, fri.toDouble()),
              FlSpot(5, sat.toDouble()),
              FlSpot(6, sun.toDouble()),
              FlSpot(7, sun.toDouble()),
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
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.2),
                  Colors.greenAccent.withOpacity(0.2)
                ])),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(-1, week1.toDouble()),
              FlSpot(0, week1.toDouble()),
              FlSpot(1, week2.toDouble()),
              FlSpot(2, week3.toDouble()),
              FlSpot(3, week4.toDouble()),
              FlSpot(4, week4.toDouble()),
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
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.2),
                  Colors.greenAccent.withOpacity(0.2)
                ])),
            gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            spots: [
              FlSpot(-1, jan.toDouble()),
              FlSpot(0, jan.toDouble()),
              FlSpot(1, feb.toDouble()),
              FlSpot(2, mar.toDouble()),
              FlSpot(3, apr.toDouble()),
              FlSpot(4, may.toDouble()),
              FlSpot(5, jun.toDouble()),
              FlSpot(6, jul.toDouble()),
              FlSpot(7, aug.toDouble()),
              FlSpot(8, sep.toDouble()),
              FlSpot(9, oct.toDouble()),
              FlSpot(10, nov.toDouble()),
              FlSpot(11, dec.toDouble()),
              FlSpot(12, dec.toDouble()),
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
}
