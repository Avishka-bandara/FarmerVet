import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmervet/farmer_reportAnimal.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CowList.dart';

class AnimalDetail extends StatelessWidget {
  final List<Cow> cows;
  final int index;

  AnimalDetail(this.cows,this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Detail',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0), // Add padding to the whole screen
        child: ListView(
          children: [
            CustomCardWidget(cows,index),
            SizedBox(height: 10),
            const Text(
              'Record the vaccination given to the animal',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  // Logic for adding vaccination details
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(28, 42, 58, 1),
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
            const SizedBox(height: 10),
            const Divider(thickness: 1.0),
            const SizedBox(height: 25),
            const Text('Ongoing Issues',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            OnIssue(),
            const SizedBox(
                height: 50), // Adjust the height as needed for spacing
            const Divider(thickness: 1.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {

              Navigator.push(context,MaterialPageRoute(builder: (context)=> ReportAnimal()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
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

class CustomCardWidget extends StatelessWidget {

  final List<Cow> cows;
  final int index;

  CustomCardWidget(this.cows,this.index);

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
                      getImageAsset(cows[index].type)), // Load the image from the database
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
                        cows[index].name,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          removeAnimal(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(234, 67, 53, 1),
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
                  Text(cows[index].tag, style: TextStyle(fontSize: 15.0)),
                  Text(
                    cows[index].age+" Months",
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
  String getImageAsset(String name) {
    switch (name) {
      case "Bull":
        return 'assets/bull.jpg';
      case "Heifer":
        return 'assets/heifer.jpg';
      case "Calf-Male":
        return 'assets/mcalf.jpg';
      default:
        return 'assets/fcalf.jpg';
    }
  }

  void removeAnimal (BuildContext context)async{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Animal'),
          content: Text('Do you want to remove '+cows[index].name),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                deleteDocument(cows[index].id,onDeleted: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Animal())
                  );
                }); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteDocument(String documentId,{VoidCallback? onDeleted}) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('Farm details/' + user!.uid + '/animal details')
          .doc(documentId)
          .delete();
      print('Document deleted successfully.');
      if (onDeleted != null) {
        onDeleted!();
      }
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}

class OnIssue extends StatefulWidget {
  @override
  State<OnIssue> createState() => _OnIssueState();
}

class _OnIssueState extends State<OnIssue> {
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
                            backgroundColor: Color.fromRGBO(254, 176, 82, 1),
                          ),
                          child: Text(
                            'Minor Issue',
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
                    fixedSize: const Size(180, 20), backgroundColor: Color.fromRGBO(28, 42, 58, 1),
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


