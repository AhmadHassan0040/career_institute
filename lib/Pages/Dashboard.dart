import 'package:career_institute/Modules/myDrawer.dart';
import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> Period = ['Weekly', 'Monthly', 'Yearly'];
  String? selectedPeriod = 'Weekly';

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
          child: Center(
            child: ListView(
              children: [
                Container(
                  height: 260,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, bottom: 25, right: 25),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(drawVerticalLine: false),
                        backgroundColor: Colors.grey.shade900,
                        minY: 0,
                        maxY: 300,
                        lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
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
                                  Colors.blue.withOpacity(0.5), // Start color
                                  Colors.greenAccent
                                      .withOpacity(0.1), // End color
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.greenAccent]),
                            spots: [
                              FlSpot(0, 130),
                              FlSpot(1, 130),
                              FlSpot(2, 180),
                              FlSpot(3, 175),
                              FlSpot(4, 200),
                              FlSpot(5, 170),
                              FlSpot(6, 250),
                            ],
                            isCurved: true,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) {
                                return FlDotCirclePainter(
                                  radius: 3,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                          LineChartBarData(
                            spots: [FlSpot(-1, 0), FlSpot(7, 0)],
                            color: Colors.transparent,
                            show: false,
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Text(
                              selectedPeriod! + ' Graph',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.7),
                            ),
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text('MON',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));
                                  case 1:
                                    return const Text('TUE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));
                                  case 2:
                                    return const Text('WED',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));
                                  case 3:
                                    return const Text('THU',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));
                                  case 4:
                                    return const Text('FRI',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));
                                  case 5:
                                    return const Text('SAT',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));
                                  case 6:
                                    return const Text('SUN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold));

                                  default:
                                    return const Text('');
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: true,
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
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'TOTAL INCOME',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '1500',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 25),
                            child: Container(
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: DropdownButton<String>(
                                  value: selectedPeriod!,
                                  style: TextStyle(color: Colors.white),
                                  dropdownColor: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(8),
                                  items: Period.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedPeriod = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
