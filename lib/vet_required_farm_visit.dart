import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmVisit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';
import 'add_animal.dart';

class Required_visits extends StatefulWidget {
  @override
  State<Required_visits> createState() => _Required_visitsState();
}

class _Required_visitsState extends State<Required_visits> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Required Farm Visits',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('Farm visit')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Wrap(
                  children: [
                    Container(
                        height: 450,
                        width: screenSize.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(
                                color: Colors.black),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Loading data"),
                          ],
                        )),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                List<FarmVisit> farmVisit = [];
                snapshot.data!.docs.forEach((doc) {
                  farmVisit.add(FarmVisit.fromMap(
                      doc.data() as Map<String, dynamic>, doc.id));
                });
                if (farmVisit.isEmpty) {
                  return Wrap(
                    children: [
                      Container(
                          width: screenSize.width,
                          height: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('No details found'),
                            ],
                          )),
                    ],
                  );
                } else {
                  return Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: farmVisit.length,
                                itemBuilder: (context, index) {
                                  return CustomCardWidget(farmVisit,index);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

//
// custom card widget
//
class CustomCardWidget extends StatefulWidget {
  final List<FarmVisit> farmVisit;
  final int index;

  CustomCardWidget(this.farmVisit,this.index);

  @override
  _CustomCardWidgetState createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  late int _selectedRadio;

  @override
  void initState() {
    super.initState();
    _selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Card(
          elevation: 5.0,
          margin: EdgeInsets.only(top: 10.0),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        //data should be retrieved from the database
                        widget.farmVisit[widget.index].cowname+"   "+widget.farmVisit[widget.index].farmName,
                        style: TextStyle(
                            color: Color.fromRGBO(75, 85, 99, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on, // Use any icon you prefer
                        color: Colors
                            .black, // Optionally, set the color of the icon
                      ),
                      SizedBox(width: 8),
                      // Adjust the width as needed for spacing
                      Text(
                        //data should be retrieved from the database

                        widget.farmVisit[widget.index].location,
                        style: TextStyle(
                          color: Color.fromRGBO(107, 114, 128, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      // Adjust the width as needed for spacing
                      Text(
                        "Reported Time : "+widget.farmVisit[widget.index].timedate,
                        style: TextStyle(
                          color: Color.fromRGBO(107, 114, 128, 1),
                        ),
                      ),
                      //the time should be retrievd from the database
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      // Adjust the width as needed for spacing
                      Text(
                        "Email : "+widget.farmVisit[widget.index].email,
                        style: TextStyle(
                          color: Color.fromRGBO(107, 114, 128, 1),
                        ),
                      ),
                      //the phone number should be retrievd from the database
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      // Adjust the width as needed for spacing
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(28, 42, 58, 1))),
                          onPressed: () {
                            //
                          },
                          child: Text(
                            "View More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(28, 42, 58, 1))),
                          onPressed: () {
                            //
                          },
                          child: Text(
                            "Mark as Visited",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
