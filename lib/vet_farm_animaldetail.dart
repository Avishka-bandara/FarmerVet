import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:farmervet/vet_diagnose_helath.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmervet/farmer_reportAnimal.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CowList.dart';
import 'animalIssue.dart';

class Vet_Animal_Detail extends StatefulWidget {
  final List<Cow> cows;
  final int indexcows;
  

  Vet_Animal_Detail(this.cows, this.indexcows);

  @override
  State<Vet_Animal_Detail> createState() => _Vet_Animal_DetailState();
}

class _Vet_Animal_DetailState extends State<Vet_Animal_Detail> {
  User? user = FirebaseAuth.instance.currentUser;

  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
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
            CustomCardWidget(widget.cows, widget.indexcows), // Display the animal details
            SizedBox(height: 10),
            const Text(
              'Record the vaccination given to the animal',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Align(
            //   alignment: Alignment.centerLeft, // Align the button to the left
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Logic for adding vaccination details
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color.fromRGBO(28, 42, 58, 1),
            //       fixedSize: const Size(200, 36),
            //     ),
            //     child: const Text(
            //       'Add Vaccination Details',
            //       style: TextStyle(
            //         fontSize: 14.0,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 10),
            const Divider(thickness: 1.0),
            const SizedBox(height: 25),
            const Text('Ongoing Issues',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            FutureBuilder<QuerySnapshot>(
              // Display the health issues
              future: FirebaseFirestore
                  .instance // Get the health issues from the database
                  .collection('Farm details/' +
                      user!.uid +
                      '/health issue') // Get the health issues from the database
                  .get(),
              builder: (context, snapshot) {
                // Build the widget
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while the data is being fetched
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
                  List<Issue> issue =
                      []; // Create a list to store the health issues
                  snapshot.data!.docs.forEach((doc) {
                    // Loop through the health issues
                    issue.add(Issue.fromMap(
                        // Add the health issues to the list
                        doc.data() as Map<String, dynamic>,
                        doc.id)); // Add the health issues to the list
                  });
                  if (issue.isEmpty) {
                    return Wrap(
                      // Display a message if no health issues are found
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
                        // Display the health issues
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                ListView.builder(
                                  // Display the health issues
                                  shrinkWrap: true,
                                  itemCount: issue.length,
                                  itemBuilder: (context, index) {
                                    // Build the widget
                                    if (issue[index]
                                            .animalid == // Check if the health issue is for the current animal
                                        widget.cows[widget.indexcows].id) {
                                      // Check if the health issue is for the current animal
                                      return OnIssue(issue,
                                          index); // Display the health issue
                                    }
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

            const SizedBox(
                height: 50), // Adjust the height as needed for spacing
            const Divider(thickness: 1.0),
          ],
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   // Add a bottom navigation bar
      //   child: Container(
      //     height: 50,
      //     padding: EdgeInsets.symmetric(horizontal: 16.0),
      //     child: ElevatedButton(
      //       onPressed: () {
      //
      //         // Navigator.push(
      //         //   context,
      //         //   MaterialPageRoute(
      //         //     builder: (context) => Diagnose_health(
      //         //                   farm: widget.farm,
      //         //                   index2: widget.index2,  .................... Navigate to the diagnose health screen
      //         //                   index: widget.index,
      //         //                   issue: widget.issue,
      //         //                 ),
      //         //   ),
      //         // );
      //       },
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: Colors.black,
      //       ),
      //       child: Text(
      //         'Add New Issue',
      //         style: TextStyle(fontSize: 16.0, color: Colors.white),
      //       ),
      //     ),
      //   ),
      // ),
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
  // Create a custom card widget
  final List<Cow> cows;
  final int index;

  CustomCardWidget(this.cows, this.index);
  int selectedRadio = 0; // Define selectedRadio within the build method

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
                  image: AssetImage(getImageAsset(cows[index].type)),
                  // Load the image from the database
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

                      // ElevatedButton(
                      //   // Add a button to remove the animal
                      //   onPressed: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         // Display a dialog box to confirm the removal of the animal
                      //         return AlertDialog(
                      //           title: Text("Reason for remove"),
                      //           content: Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: <Widget>[
                      //               RadioListTile(
                      //                 title: Text("Stolen"),
                      //                 value: 1,
                      //                 groupValue: selectedRadio,
                      //                 onChanged: (value) {
                      //                   Navigator.of(context).pop();
                      //                   removeAnimal(context, "Stolen");
                      //                   // You can handle the selected radio value here
                      //                   selectedRadio = value as int;
                      //                 },
                      //               ),
                      //               RadioListTile(
                      //                 title: Text("Deceased "),
                      //                 value: 2,
                      //                 groupValue: selectedRadio,
                      //                 onChanged: (value) {
                      //                   Navigator.of(context).pop();
                      //                   removeAnimal(context, "Deceased");
                      //                   // You can handle the selected radio value here
                      //                   selectedRadio = value as int;
                      //                 },
                      //               ),
                      //               RadioListTile(
                      //                 title: Text("Unproductive "),
                      //                 value: 3,
                      //                 groupValue: selectedRadio,
                      //                 onChanged: (value) {
                      //                   Navigator.of(context).pop();
                      //                   removeAnimal(context, "Unproductive");
                      //                   // You can handle the selected radio value here
                      //                   selectedRadio = value as int;
                      //                 },
                      //               ),
                      //             ],
                      //           ),
                      //           actions: <Widget>[
                      //             TextButton(
                      //               onPressed: () {
                      //                 Navigator.of(context).pop();
                      //               },
                      //               child: Text("Cancel"),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color.fromRGBO(234, 67, 53, 1),
                      //   ),
                      //   child: const Text(
                      //     'Remove Animal',
                      //     style: TextStyle(
                      //       fontSize: 12,
                      //       color: Color.fromRGBO(255, 255, 255, 1),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Divider(thickness: 1.0),
                  Text(cows[index].tag, style: TextStyle(fontSize: 15.0)),
                  Text(
                    cows[index].age +
                        " Months", // Display the age of the animal
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
      case "Cow":
        return 'assets/bull.jpg';
      case "Heifer":
        return 'assets/heifer.jpg';
      case "Calf-Male":
        return 'assets/mcalf.jpg';
      default:
        return 'assets/fcalf.jpg';
    }
  }

  void removeAnimal(BuildContext context, String reason) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Animal'),
          content: Text('Do you want to remove ' + cows[index].name),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('remove animal')
                    .doc()
                    .set({
                  'reason': reason,
                  // Add more fields as needed
                }).then((value) {
                  deleteDocument(cows[index].id, onDeleted: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Animal()));
                  });
                }).catchError((error) {
                  print("Failed to store data: $error");
                });

                // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteDocument(String documentId,
      {VoidCallback? onDeleted}) async {
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
  final List<Issue> issue;
  final int index;

  OnIssue(this.issue, this.index);

  @override
  State<OnIssue> createState() => _OnIssueState();
}

class _OnIssueState extends State<OnIssue> {
  @override
  Widget build(context) {
    return Column(
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
                      'Health Issue : ' +
                          widget.issue[widget.index].animalissue,
                      style: TextStyle(fontSize: 16),
                    ),
                    widget.issue[widget.index].visit == false
                        ? ElevatedButton(
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
                          )
                        : SizedBox(),
                  ],
                ),
                Text('Date : ' + widget.issue[widget.index].timeDate),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                removeAnimalissue(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(180, 20),
                backgroundColor: Color.fromRGBO(28, 42, 58, 1),
              ),
              child: Text('Now Healthy', style: TextStyle(color: Colors.white)),
            ),
            OutlinedButton(
              onPressed: () {},
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
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  void removeAnimalissue(context) async {
    bool _refreshIndicatorVisible = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Healthy'),
          content: Text('Are you sure ' +
              widget.issue[widget.index].animalname +
              ' is healthy now?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('yes'),
              onPressed: () {
                deleteDocumentissue(widget.issue[widget.index].id,
                    onDeleted: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Animal()));
                }); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteDocumentissue(String documentId,
      {VoidCallback? onDeleted}) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('Farm details/' + user!.uid + '/health issue')
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
