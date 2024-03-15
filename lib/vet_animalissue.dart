import 'package:flutter/material.dart';

class vetAnimalIssue extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Issue'),
        centerTitle: true,
      ),
      body: Padding(
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
                          Text('Top Card',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                          Text("card",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 20.0),
                    ],
                  )),
            ),
            SizedBox(height: 20.0),
            Text(
              'Below the Top Card',
              textAlign: TextAlign.center,
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
                  onPressed: () {
                    // Handle first button press
                  },
                  child: Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle second button press
                  },
                  child: Text('Button 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


