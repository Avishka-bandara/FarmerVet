import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int activeFarms = 10; // Example value for active farms
    int inactiveFarms = 5; // Example value for inactive farms

    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Active Farms',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '$activeFarms',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                          child: VerticalDivider(
                              thickness: 1, color: Colors.black),
                        ),
                        Column(
                          children: [
                            Text(
                              'Inactive Farms',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '$inactiveFarms',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ), // Showing the Deseased unproductive and lost/stolen animals
              Container(
                //height: 100.0,
                margin: EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Deseased',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '20', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(29, 36, 217, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '35', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(180, 187, 17, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '35', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(50, 119, 32, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10)
                          ],
                        ),
                        SizedBox(
                          height: 100, // Adjust the height as needed
                          child: VerticalDivider(
                              thickness: 1, color: Colors.black),
                        ),
                        Column(
                          children: [
                            Text(
                              'Unproductive',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '5', // Example value for Unproductive animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(29, 36, 217, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '15', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(180, 187, 17, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '35', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(50, 119, 32, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100, // Adjust the height as needed
                          child: VerticalDivider(
                              thickness: 1, color: Colors.black),
                        ),
                        Column(
                          children: [
                            Text(
                              'Lost/stolen',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '15', // Example value for lost/stolen animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(29, 36, 217, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '2', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(180, 187, 17, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '35', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(50, 119, 32, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40), // Adjust the height as needed
                        Text(
                          "Total Active Animals",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Showing the total active animals
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('60',
                                  style: TextStyle(
                                      color: Color.fromRGBO(29, 36, 217, 1),
                                      fontWeight: FontWeight.bold)),
                              Text('Cow',
                                  style: TextStyle(
                                      color: Color.fromRGBO(29, 36, 217, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text('60',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color.fromRGBO(180, 187, 17, 1),
                                      fontWeight: FontWeight.bold)),
                              Text('Calf',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color.fromRGBO(180, 187, 17, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '35', // Example value for deseased animals
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(50, 119, 32, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Heifer', // Example value for deseased animals
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(50, 119, 32, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ]),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                //height: 100.0,
                margin: EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: barchart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class barchart extends StatefulWidget {
  @override
  _barchartState createState() => _barchartState();
}

class _barchartState extends State<barchart> {
  List<double> data = List.filled(12, 0); // Initial data for Y-axis
  List<String> years = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<double> value = [
    7.0,
    5.6,
    12.1,
    3.8,
    5.0,
    1.0,
    11.0,
    1.36,
    8.6,
    3.6,
    7.8,
    13.8,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceEvenly,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: EdgeInsets.zero,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                  color: Color.fromRGBO(79, 79, 79, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                margin: 10,
                getTitles: (double value) {
                  return years[value.toInt()];
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => TextStyle(
                  color: Color.fromRGBO(79, 79, 79, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                margin: 10,
                reservedSize: 28,
                interval: 1.25,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border:
                  Border.all(color: Color.fromRGBO(189, 189, 189, 1), width: 1),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              horizontalInterval: 1,
              drawVerticalLine: true,
              verticalInterval: 11,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color.fromRGBO(189, 189, 189, 1),
                  strokeWidth: 1.2,
                  dashArray: [1],
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Color.fromRGBO(189, 189, 189, 1),
                  strokeWidth: 1.2,
                  dashArray: [5],
                );
              },
            ),
            barGroups: List.generate(
              data.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    y: value[index],
                    colors: [Color.fromRGBO(133, 130, 136, 1)],
                    width: 7,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OverviewScreen(),
  ));
}
