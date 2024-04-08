import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/milkTotalByMonth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'milkData.dart';

class OverviewScreen extends StatefulWidget {
  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

  int activeCount=0;
  int inactiveCount=0;
  int _stolen = 0;
  int _deceased = 0;
  int _unproductive = 0;
  int Bullcount=0;
  int Heifercount=0;
  int Calf_Malecount=0;
  int Calf_Femalecount=0;

  @override
  void initState() {
    super.initState();
    getactiveinactive();
    getremovereason();
    getTotalanimalcount();
  }


  @override
  Widget build(BuildContext context) {
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
                              '$activeCount',
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
                              '$inactiveCount',
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
                              '$_deceased', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
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
                              '$_unproductive', // Example value for Unproductive animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
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
                              'Lost/stolen',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '$_stolen', // Example value for lost/stolen animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10)
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
                              Text('$Bullcount',
                                  style: TextStyle(
                                      color: Color.fromRGBO(29, 36, 217, 1),
                                      fontWeight: FontWeight.bold)),
                              Text('Bull',
                                  style: TextStyle(
                                      color: Color.fromRGBO(29, 36, 217, 1),
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text('$Calf_Malecount',
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
                                '$Heifercount', // Example value for deseased animals
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(50, 119, 32, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Cow', // Example value for deseased animals
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
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Text("Monthly Yeild Milk Range",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text("Total in Litres", style: TextStyle(fontSize: 12.0)),
                      barchart(),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: circle_indi(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getremovereason() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query to get documents with field "status" equal to "active"
    QuerySnapshot stolen = await firestore
        .collection('remove animal')
        .where('reason', isEqualTo: 'Stolen')
        .get();


    // Query to get documents with field "status" equal to "inactive"
    QuerySnapshot deceased = await firestore
        .collection('remove animal')
        .where('reason', isEqualTo: 'Deceased')
        .get();

    QuerySnapshot unproductive = await firestore
        .collection('remove animal')
        .where('reason', isEqualTo: 'Unproductive')
        .get();

     setState(() {
       _stolen += stolen.docs.length;
       _deceased += deceased.docs.length;
       _unproductive += unproductive.docs.length;
     });
  }

  Future<void> getactiveinactive() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query to get documents with field "status" equal to "active"
    QuerySnapshot activeSnapshot = await firestore
        .collection('Farm details')
        .where('status', isEqualTo: 'active')
        .get();

    // Query to get documents with field "status" equal to "inactive"
    QuerySnapshot inactiveSnapshot = await firestore
        .collection('Farm details')
        .where('status', isEqualTo: 'inactive')
        .get();

    setState(() {
      activeCount += activeSnapshot.docs.length;
      inactiveCount += inactiveSnapshot.docs.length;
    });

  }

  Future<void> getTotalanimalcount() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Farm details')
        .get();

    List<String> documentIds = snapshot.docs.map((doc) => doc.id).toList();

    documentIds.forEach((id) async {
      QuerySnapshot cowcount = await firestore
          .collection('Farm details/'+id+'/animal details')
          .where('animaltype', isEqualTo: 'Cow')
          .get();

      QuerySnapshot bullcount = await firestore
          .collection('Farm details/'+id+'/animal details')
          .where('animaltype', isEqualTo: 'Bull')
          .get();

      QuerySnapshot heifercount = await firestore
          .collection('Farm details/'+id+'/animal details')
          .where('animaltype', isEqualTo: 'Heifer')
          .get();

      QuerySnapshot calf_Malecount = await firestore
          .collection('Farm details/'+id+'/animal details')
          .where('animaltype', isEqualTo: 'Calf-Male')
          .get();

      QuerySnapshot calf_Femalecount = await firestore
          .collection('Farm details/'+id+'/animal details')
          .where('animaltype', isEqualTo: 'Calf-Female')
          .get();

      setState(() {
        Bullcount += bullcount.docs.length;
        Heifercount += heifercount.docs.length + cowcount.docs.length;
        Calf_Malecount += calf_Malecount.docs.length+calf_Femalecount.docs.length;
      });

    });

  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

//
//............... displaying the Bar charts...............
//
class barchart extends StatefulWidget {
  @override
  _barchartState createState() => _barchartState();
}

class _barchartState extends State<barchart> {
  List<double> data = List.filled(12, 0);// Initial data for Y-axis
  List<String> years = [
    'Jan ',
    'Feb ',
    'Mar ',
    'Apr ',
    'May ',
    'Jun ',
    'Jul ',
    'Aug ',
    'Sep ',
    'Oct ',
    'Nov ',
    'Dec '
  ];
  List<double> value = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalamilkcount();
  }

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

  Future<void> getTotalamilkcount() async {

    DateTime now = DateTime.now();
    String currentYear = now.year.toString();
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Farm details')
        .get();

    List<String> documentIds = snapshot.docs.map((doc) => doc.id).toList();

    documentIds.forEach((id) async {
      List<Milk> milks = [];
      snapshot = await FirebaseFirestore.instance
          .collection('Farm details/'+id+'/milk output')
          .get();

      snapshot.docs.forEach((doc) {
        milks.add(Milk.fromMap(doc.data()as Map<String, dynamic>, doc.id));
      });

      MilkListtotal milkList = MilkListtotal(milks: milks);

      Map<String, double> totalLitersByMonth = milkList.getTotalLitersByMonth();

      totalLitersByMonth.forEach((monthYear, totalLiters) {
        if(monthYear.substring(3)==currentYear){
          if(monthYear.substring(0,2)=="01"){
            setState(() {
              value[0]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="02"){
            setState(() {
              value[1]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="03"){
            setState(() {
              value[2]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="04"){
            setState(() {
              value[3]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="05"){
            setState(() {
              value[4]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="06"){
            setState(() {
              value[5]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="07"){
            setState(() {
              value[6]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="08"){
            setState(() {
              value[7]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="09"){
            setState(() {
              value[8]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="10"){
            setState(() {
              value[9]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="11"){
            setState(() {
              value[10]+=totalLiters;
            });
          }
          else if(monthYear.substring(0,2)=="12"){
            setState(() {
              value[11]+=totalLiters;
            });
          }
        }
      });
    }
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


}

//
//............... displaying the breeding metrics...............
//

class circle_indi extends StatefulWidget {
  @override
  _circle_indiState createState() => _circle_indiState();
}

class _circle_indiState extends State<circle_indi> {
  late int aiMethodsCount;
  late int pdsbyAi;
  late int male;
  late int female;
  late String fmratio;
  late int calving;
  late int pregnant;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFirestoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Breeding Metrics", style: TextStyle(fontSize: 14.0)),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/Medikit.png',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: CircularPercentIndicator(
                      radius: 27.0,
                      lineWidth: 4.0,
                      percent: aiMethodsCount.toDouble()/100,
                      center: new Text(
                          aiMethodsCount.toString(), //...............Number of AI s getting data from reproduction table...............
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(36, 52, 101, 1))),
                      progressColor: Color.fromRGBO(4, 191, 218, 1),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("AI s", style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/Stehoscope.png',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: CircularPercentIndicator(
                      radius: 27.0,
                      lineWidth: 4.0,
                      percent: pdsbyAi/100,
                      center: new Text(
                          pdsbyAi.toString(), //...............Number of PDs by AI s getting data from reproduction table...............
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(36, 52, 101, 1))),
                      progressColor: Color.fromRGBO(4, 191, 218, 1),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("PDs by AIs", style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/kid.png',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: CircularPercentIndicator(
                      radius: 27.0,
                      lineWidth: 4.0,
                      percent: (calving/pregnant)/100,
                      center: new Text(
                          ((calving/pregnant)/100).toStringAsFixed(2)+" %", //...............Calving percentage getting data from reproduction table...............
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(36, 52, 101, 1))),
                      progressColor: Color.fromRGBO(4, 191, 218, 1),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("Calving", style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/transgender.png',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: CircularPercentIndicator(
                      radius: 27.0,
                      lineWidth: 4.0,
                      percent: ((male/(female+male))*100)/10000,
                      center: new Text(
                          fmratio, //...............M:F ratio getting data from reproduction table (there is no data in the table)...............
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(36, 52, 101, 1))),
                      progressColor: Color.fromRGBO(4, 191, 218, 1),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("M:F Ratio", style: TextStyle(fontSize: 14.0)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> fetchFirestoreData() async {
    aiMethodsCount=0;
    pdsbyAi=0;
    male=0;
    female=0;
    fmratio='';
    calving=0;
    pregnant=0;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Farm details')
        .get();

    List<String> documentIds = snapshot.docs.map((doc) => doc.id).toList();

    documentIds.forEach((id) async {
       snapshot = await FirebaseFirestore.instance
          .collection('Farm details/'+id+'/animal details')
          .get();

      List<String> cowsdocumentIds = snapshot.docs.map((doc) => doc.id).toList();

       cowsdocumentIds.forEach((cowid) async {
         
         snapshot = await FirebaseFirestore.instance
             .collection('Farm details/' + id +
             '/animal details/' +cowid+
             '/breeding details')
             .get();
         List<DocumentSnapshot> documents = snapshot.docs;
         setState(() {
           aiMethodsCount += _calculateAIMethodsCount(documents);
           pdsbyAi+=_pdsbyai(documents);
           male+=_male(documents);
           female+=_female(documents);
           fmratio = (male).toString()+' : '+(female).toString();
           calving += _calving(documents);
           pregnant+=_pregnant(documents);
         });
       });
    });
    }

  int _calculateAIMethodsCount(List<DocumentSnapshot> documents) {
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return data.containsKey('method') && data['method'] == 'AI';
    }).length;
  }

  int _pdsbyai(List<DocumentSnapshot> documents) {
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return data.containsKey('method') && data['method'] == 'AI' &&
          data.containsKey('pregnantdate');
    }).length;
  }

  int _male(List<DocumentSnapshot> documents) {
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return data.containsKey('gender') && data['gender'] == 'Male' &&
          data.containsKey('stage') && data['stage'] == 'Gave birth';
    }).length;
  }

  int _female(List<DocumentSnapshot> documents) {
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return data.containsKey('gender') && data['gender'] == 'Female' &&
          data.containsKey('stage') && data['stage'] == 'Gave birth';
    }).length;
  }

  int _calving(List<DocumentSnapshot> documents) {
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return
          data.containsKey('stage') && data['stage'] == 'Gave birth';
    }).length;
  }

  int _pregnant(List<DocumentSnapshot> documents) {
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return
        data.containsKey('pregnantdate');
    }).length;
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
