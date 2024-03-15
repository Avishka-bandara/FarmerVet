import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';

import 'CowList.dart';
import 'add_animal.dart';

class Animal extends StatefulWidget {
  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  User? user = FirebaseAuth.instance.currentUser;
  late Size screenSize;
  @override
  void initState() {
    super.initState();
    // Initialize controller values for testing
  }

  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        height: screenSize.height,
        width: screenSize.width,
        child: Wrap(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text('Add Milk Data',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('Add the milk data of your farm here'),
                ),
                Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => dailyMilkEntry()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(160, 45),
                    ),
                    child: Text(
                      'Add Milk Data',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => totalMilkOutput()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(160, 45),
                    ),
                    child: Text(
                      'Farm Milk Output',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10),
                Divider(thickness: 1),
                SizedBox(height: 10),
                CustomSearchBar(),
                SizedBox(height: 10),

      FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Farm details/${user!.uid}/animal details').get(),
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
                        const CircularProgressIndicator(color: Colors.black),
                        SizedBox(height: 20,),
                        Text("Loading data"),
                      ],
                    )),
                  ],
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          else {
            List<Cow> cows = [];
            snapshot.data!.docs.forEach((doc) {
              cows.add(Cow.fromMap(doc.data() as Map<String, dynamic>, doc.id));
            });
            if (cows.isEmpty) {
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
              return Container(
                width: screenSize.width,
                height: screenSize.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: cows.length,
                            itemBuilder: (context, index) {
                              return CustomCardWidget(cows,index);
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
          ],
        ),
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
                    title: Text('Add new animal '),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> addAnimalForm()));
                    },
                  ),
                  ListTile(
                    title: Text('Farm milk output'),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> totalMilkOutput()));
                    },
                  ),
                  ListTile(
                    title: Text('Account'),
                    onTap: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> Animal()));
                    },
                  ),
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
}

// search bar widget

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String searchText = '';
  List<String> selectedKeywords = [];
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchText = value;
        });
      },
      onSubmitted: (value) {
        searchDatabase(value); // Call function to search the database
      },
      decoration: InputDecoration(
        hintText: "Search for an animal",
        prefixIcon: Icon(Icons.search_outlined),
        suffixIcon: PopupMenuButton(
          icon: Icon(Icons.tune),
          itemBuilder: (BuildContext context) {
            return [
              //cow, calf - male, calf female, bull, heifer
              PopupMenuItem(
                child: Text('cow'),
                value: 'cow',
              ),
              PopupMenuItem(
                child: Text('calf-male'),
                value: 'calf-male',
              ),
              PopupMenuItem(
                child: Text('calf female'),
                value: 'calf female',
              ),
              PopupMenuItem(
                child: Text('bull'),
                value: 'bull',
              ),
              PopupMenuItem(
                child: Text('heifer'),
                value: 'heifer',
              ),
            ];
          },
          onSelected: (String value) {
            // Handle selection of keywords
            setState(() {
              searchText = value;
            });
            searchDatabase(value);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }

  void searchDatabase(String keyword) {
    // Perform database query with the selected keywords
    print('Searching database for: $keyword');
  }
}

void signout (BuildContext context)async{
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Signed Out'),
        content: Text('Do you need to sign out.'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginScreen())); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

//
// custom card widget
//
class CustomCardWidget extends StatelessWidget {
  final List<Cow> cows;
  final int index;

  CustomCardWidget(this.cows,this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3.0,
        margin: EdgeInsets.only(top: 10.0),
        child: InkWell(
          onTap: () => Get.to(AnimalDetail()),
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        cows[index].name, // Replace with the actual name from the database
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cows[index].type,
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(width: 140),
                            Text(
                              cows[index].age, // Replace with the actual age from the database
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ]),
                      SizedBox(height: 5),
                    ])),
              ],
            ),
          ),
        ));
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
