import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmList.dart';
import 'package:farmervet/overview.dart';
import 'package:farmervet/user_login.dart';
import 'package:farmervet/vet_animal.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:farmervet/vet_farm_detail.dart';
import 'package:farmervet/vet_required_farm_visit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'CowList.dart';
import 'farmList.dart';
import 'farmList.dart';

class FarmViewScreen extends StatefulWidget {
  @override
  State<FarmViewScreen> createState() => _FarmViewScreenState();
}

class _FarmViewScreenState extends State<FarmViewScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  late Size screenSize;
  List<Farm>?farm;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farm View',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    //fillColor: Color.fromRGBO(209, 213, 219, 1),
                    hintText: 'Search farms',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search_outlined),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('Farm details')
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
                      farm = [];
                      snapshot.data!.docs.forEach((doc) {
                        farm!.add(Farm.fromMap(
                            doc.data() as Map<String, dynamic>, doc.id));
                      });
                      if (farm!.isEmpty) {
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
                        return SingleChildScrollView(
                          child: Container(
                            width: screenSize.width,
                            height: screenSize.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: farm!.length,
                                      itemBuilder: (context, index) {
                                        return FarmCard(farm!, index);
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
              ],
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  ListTile(
                    title: Text('New Health Problems Reported'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                vet_animal(farm!)),
                      );
                      //Navigate to vet_animal.dart
                    },
                  ),
                  ListTile(
                    title: Text('Requard Farm Visit'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Required_visits()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Overview'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('View Farms'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmViewScreen()),
                      );
                    },
                  ),
                  // ListTile(
                  //   // title: Text('Reported Health Issue'),
                  //   // onTap: () {
                  //   //   Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(builder: (context) => vet_animal( )),
                  //   //   );
                  //   // },
                  // ),
                ],
              ),
            ),
            // This ListTile is now at the bottom of the Drawer
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                signout(context);
              },
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  void signout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Do you need to Log out.'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen())); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}

class FarmCard extends StatefulWidget {
  final List<Farm> farm;
  final int index;

  FarmCard(this.farm, this.index);

  @override
  State<FarmCard> createState() => _FarmCardState();
}

class _FarmCardState extends State<FarmCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onLongPress: () {
          removeView(context);
        },
        onTap: () {
          if (widget.farm[widget.index].status == "active") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FarmDetailView(widget.farm, widget.index)));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.farm[widget.index].name,
                      // Replace with the farm name from the database
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      widget.farm[widget.index].status,
                      // Replace with the farm name from the database
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(children: [
                  Icon(Icons
                      .location_on_outlined), // Add your desired prefix icon here
                  SizedBox(width: 5),
                  Text(
                    widget.farm[widget.index].area,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ]),
                Divider(thickness: 1.0),
                SizedBox(height: 5),
                Row(
                  children: [
                    // Icon(Icons
                    //     .location_on_outlined), // Add your desired prefix icon here
                    // SizedBox(
                    //     width:
                    //         5), // Adjust spacing between icon and text as needed
                    Text(
                      widget.farm[widget.index].email,
                      // Replace with the farm name from the database
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void removeView(BuildContext context) {
    if (widget.farm[widget.index].status == 'active') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Farm Settings'),
            content: Text('Do you need to mark ' +
                widget.farm[widget.index].name +
                ' farm as Inactive'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('yes'),
                onPressed: () {
                  updateStatus('inactive');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (widget.farm[widget.index].status == 'inactive') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Farm Settings'),
            content: Text('Do you need to mark ' +
                widget.farm[widget.index].name +
                ' farm as active'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('yes'),
                onPressed: () {
                  updateStatus('active');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> updateStatus(String status) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DocumentReference documentReference =
        _firestore.collection('Farm details').doc(widget.farm[widget.index].id);

    await documentReference.update({
      'status': status,
    }).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FarmViewScreen()),
      );
    });
  }
}
