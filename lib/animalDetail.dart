import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Detail'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardWidget(),
            SizedBox(height: 10),
            Center(
              // Wrap the Text widget with Center
              child: Text(
                'Record the vaccination given to the animal',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Logic for adding vaccination details
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(28, 42, 58, 1),
                fixedSize: const Size(200, 36), // Change the size as needed
              ),
              child: const Text(
                'Add Vaccination Details',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1.0),
            SizedBox(height: 25),
            Text('Ongoing Issues',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            onIssue(),
          ],
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/cow.jpg'), // Load the image from the database
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              // Wrap the Column with Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cow 1',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Remove the animal from the database
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(234, 67, 53, 1),
                        ),
                        child: const Text(
                          'Remove Animal',
                          style: TextStyle(
                            fontSize: 10.1,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.0),
                  Text('Tag No : ', style: TextStyle(fontSize: 15.0)),
                  Text(
                    '6 Months',
                    style: TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Health Issue',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// grid view for On Going Issues

class onIssue extends StatefulWidget {
  @override
  State<onIssue> createState() => _onIssueState();
}

class _onIssueState extends State<onIssue> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Wrap with Expanded
      child: GridView.count(
        crossAxisCount: 1, // Number of columns in the grid
        mainAxisSpacing: 8.0, // Spacing between rows
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Health Issue',
                            style: TextStyle(fontSize: 16),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Logic for the button
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(254, 176, 82, 1),
                            ),
                            child: Text(
                              'Minnor Issue',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Date'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Logic for the first button
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(234, 67, 53, 1),
                      fixedSize: Size(120, 15),
                    ),
                    child: Text('Button 1'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Logic for the second button
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(234, 67, 53, 1),
                      fixedSize: Size(120, 15),
                    ),
                    child: Text('Button 2'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
