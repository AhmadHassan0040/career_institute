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
  late Set<String> _selectedPeriod = {'WEEKLY GRAPH'};
  void updateSelectedPeriod(Set<String> newSelectedPeriod) {
    setState(() {
      _selectedPeriod = newSelectedPeriod;
    });
  }

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
        backgroundColor: Color.fromARGB(255, 0, 122, 222),
      ),
      drawer: myDrawer(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              Container(
                height: 70,
                color: Color.fromARGB(255, 0, 122, 222),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        _selectedPeriod.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      Text('\$1500',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      Text(
                        'TOTAL INCOME THIS MONTH',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 260,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 122, 222),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        horizontalInterval: 40,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.white24,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      backgroundColor: Color.fromARGB(255, 0, 122, 222),
                      minY: 0,
                      maxY: 300,
                      lineTouchData:
                          LineTouchData(touchTooltipData: LineTouchTooltipData(
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
                          belowBarData:
                              BarAreaData(show: true, color: Colors.white24),
                          color: Colors.white,
                          spots: [
                            FlSpot(-1, 130),
                            FlSpot(0, 130),
                            FlSpot(1, 130),
                            FlSpot(2, 180),
                            FlSpot(3, 175),
                            FlSpot(4, 200),
                            FlSpot(5, 170),
                            FlSpot(6, 250),
                            FlSpot(7, 250),
                          ],
                          isCurved: true,
                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 3,
                                color: Colors.white38,
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
                  ),
                ),
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SegmentedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white)),
                            showSelectedIcon: false,
                            multiSelectionEnabled: false,
                            segments: <ButtonSegment<String>>[
                              ButtonSegment<String>(
                                  value: 'WEEKLY GRAPH', label: Text('WEEKLY')),
                              ButtonSegment<String>(
                                  value: 'MONTHLY GRAPH',
                                  label: Text('MONTHLY')),
                              ButtonSegment<String>(
                                  value: 'YEARLY GRAPH', label: Text('YEARLY')),
                            ],
                            selected: _selectedPeriod,
                            onSelectionChanged: updateSelectedPeriod,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
}
