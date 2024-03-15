import 'package:flutter/material.dart';

class vetAnimalIssue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Issue'),
        centerTitle: true,
      ),
      body: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 1.0,
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Cow 1',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10.0),
                              Text("Farm 1",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "Dvisional Secretariat",
                                style: TextStyle(fontSize: 14),
                              ), // replace devisional secretariat from data base
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "Reported Date : ",
                                style: TextStyle(fontSize: 14),
                              ) // grama niladhari from data base
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "Phone Number :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ) // mobile number from data base
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Farmer mentioned symtomns',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(28, 42, 58, 1),
                        fixedSize: Size(150, 20),
                      ),
                      onPressed: () {
                        // this button handle according to the issue
                      },
                      child: Text('Symtom 1',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(28, 42, 58, 1),
                        fixedSize: Size(150, 20),
                      ),
                      onPressed: () {
                        // Handle second button press
                      },
                      child: Text('Symtom 2',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Comments',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
