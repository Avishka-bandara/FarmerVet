import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';
import 'add_animal.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Diagnose_health(),
    );
  }
}

class Diagnose_health extends StatefulWidget {
  @override
  State<Diagnose_health> createState() => _diagnose_health();
}

class _diagnose_health extends State<Diagnose_health> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select to Diagnose Health',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(children: [
            SizedBox(height: 10),
            Text(
              "Specify a health issue based on animal condition mentioned by farmer",
              style: TextStyle(
                  color: Color.fromRGBO(107, 114, 128, 1), fontSize: 18),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            CustomCardWidget(),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(28, 42, 58, 1)),
              ),
              onPressed: () {
                // Functionality for the third button
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
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
        Card(
          elevation: 3.0,
          margin: EdgeInsets.only(top: 10.0),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(28, 42, 58,
                                      1); // Change color when pressed
                                }
                                return Colors.white; // Default color
                              },
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromRGBO(28, 42, 58, 1),
                                  width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            // Functionality for the first button
                          },
                          child: Text(
                            "Limping",
                            style:
                                TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(28, 42, 58,
                                      1); // Change color when pressed
                                }
                                return Colors.white; // Default color
                              },
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromRGBO(28, 42, 58, 1),
                                  width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            // Functionality for the second button
                          },
                          child: Text(
                            "Diarrhoea",
                            style:
                                TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(28, 42, 58,
                                      1); // Change color when pressed
                                }
                                return Colors.white; // Default color
                              },
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromRGBO(28, 42, 58, 1),
                                  width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            // Functionality for the third button
                          },
                          child: Text(
                            "Fever",
                            style:
                                TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(28, 42, 58,
                                      1); // Change color when pressed
                                }
                                return Colors.white; // Default color
                              },
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromRGBO(28, 42, 58, 1),
                                  width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            // Functionality for the first button
                          },
                          child: Text(
                            "Symptom",
                            style:
                                TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(28, 42, 58,
                                      1); // Change color when pressed
                                }
                                return Colors.white; // Default color
                              },
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromRGBO(28, 42, 58, 1),
                                  width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            // Functionality for the second button
                          },
                          child: Text(
                            "Symptom",
                            style:
                                TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromRGBO(28, 42, 58,
                                      1); // Change color when pressed
                                }
                                return Colors.white; // Default color
                              },
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Color.fromRGBO(28, 42, 58, 1),
                                  width: 1.0),
                            ),
                          ),
                          onPressed: () {
                            // Functionality for the third button
                          },
                          child: Text(
                            "Symptom",
                            style:
                                TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                          ),
                        ),
                      ),
                    ],
                  ), // Add some space between the rows
                ],
              ),
            ),
          ),
        ),
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
                    children: [Text("Choose:")],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            _selectedRadio = value as int;
                          });
                        },
                        activeColor: Color.fromRGBO(28, 42, 58, 1),
                      ),
                      Text("Requires immediate visit to farm"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            _selectedRadio = value as int;
                          });
                        },
                        activeColor: Color.fromRGBO(28, 42, 58, 1),
                      ),
                      Text("Does not require visit"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Visibility(
                      visible: _selectedRadio == 2,
                      // Show label when radio button with value 1 is selected
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 176, 82, 1),
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius as needed
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            // Adjust padding as needed
                            child: Text(
                              'Minor Issue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
