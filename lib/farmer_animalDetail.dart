import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_reportAnimal.dart';

class AnimalDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Detail',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0), // Add padding to the whole screen
        child: ListView(
          children: [
            CustomCardWidget(),
            SizedBox(height: 10),

            Text(
              'Record the vaccination given to the animal',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  // Logic for adding vaccination details
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(28, 42, 58, 1),
                  fixedSize: const Size(200, 36),
                ),
                child: const Text(
                  'Add Vaccination Details',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
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
            SizedBox(height: 50), // Adjust the height as needed for spacing
            Divider(thickness: 1.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              Get.to(ReportAnimal()); // Navigate to the Add Issue screen
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text(
              'Add New Issue',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
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
          children: [
            Container(
              width: 130,
              height: 130,
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
                            fontSize: 12,
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

class onIssue extends StatefulWidget {
  @override
  State<onIssue> createState() => _onIssueState();
}

class _onIssueState extends State<onIssue> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 8.0,
      shrinkWrap:
          true, // Add this to allow GridView to scroll inside SingleChildScrollView
      physics: NeverScrollableScrollPhysics(), // Prevent scrolling of GridView
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('Date'),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic for the first button
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 20),
                    primary: Color.fromRGBO(28, 42, 58, 1),
                  ),
                  child: Text('Now Healthy',
                      style: TextStyle(color: Colors.white)),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Logic for the second button
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 20),
                  ),
                  child: Text(
                    'Comment',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
