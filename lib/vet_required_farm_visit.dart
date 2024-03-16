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
    return Scaffold(
      appBar: AppBar(
        title: Text('Required Farm Visits',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(children: [
            SizedBox(height: 10),
            Text(
              "Farm visits for animal health issues posted by farmer or officer",
              style: TextStyle(
                  color: Color.fromRGBO(107, 114, 128, 1), fontSize: 18),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            CustomCardWidget(),
            SizedBox(height: 10),
            CustomCardWidget(),
            SizedBox(height: 10),
            CustomCardWidget(),
          ]),
        ),
      ),
    );
  }
}

//
// custom card widget
//
class CustomCardWidget extends StatefulWidget {
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
                        "Cow 01 Farm 01",
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

                        "Requires immediate visit to farm",
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
                        "Reported Time",
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
                        "Phone Number",
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
