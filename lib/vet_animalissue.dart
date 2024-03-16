import 'package:farmervet/vet_animal.dart';
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
                          Text('Cow 1',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                          Text("Farm 1",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Text('Divisional Secretary :',
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          SizedBox(width: 10.0),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Text('Reported Time  :',
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          SizedBox(width: 10.0),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Text('Phone Number:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Farmer mentioned symptoms ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle first button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(150, 50),
                  ),
                  child: Text('Symtom 1',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle second button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(150, 50),
                  ),
                  child: Text('Symtom 2',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Comments',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text("Comments If Added only"),
            SizedBox(height: 20.0),
            Text("View Added Images", style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            Container(
              height: 150,
              width: 200,
              color: Colors.grey,
            ),
            // load the image releted to issue
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => vetAnimalIssue()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(28, 42, 58, 1),
                fixedSize: const Size(300, 50),
              ),
              child: Text('Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => vet_animal()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 50),
              ),
              child: Text('Decline',
                  style: TextStyle(
                      color: Color.fromRGBO(28, 42, 58, 1), fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
