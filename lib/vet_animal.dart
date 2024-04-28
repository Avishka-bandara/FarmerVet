import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/user_login.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'animalIssue.dart';
import 'farmList.dart';

class vet_animal extends StatefulWidget {
  final List<Farm> farm;
  vet_animal(this.farm);

  @override
  State<vet_animal> createState() => _vet_animalState();
}

class _vet_animalState extends State<vet_animal> {
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
        child: ListView(children: [
          ListTile(
            title: Text('New Health Reported',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle:
                Text('Check the animal health issues posted by the farmer'),
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
          ]),
          SizedBox(height: 10),
          Divider(thickness: 2),
          SizedBox(height: 10),
          CustomSearchBar(),
          SizedBox(height: 16),
          FutureBuilder<Map<String, dynamic>>(
            future: getFarmAnimalIssues(),
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
                List<Issue> issue = snapshot.data!['issues'];
                List<Farm> getFarm = snapshot.data!['availableFarms'];

                //showToast(issue.length.toString());
                //showToast(getFarm.length.toString());
                if (issue.isEmpty) {
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
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: issue.length,
                            itemBuilder: (context, index) {
                              return CustomCardWidget(
                                  getFarm, index, issue, index);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ]),
      ),
    );
  }

  Future<Map<String, dynamic>> getFarmAnimalIssues() async {
    List<Issue> issues = [];
    List<Farm> getFarm = [];
    for (Farm farm in widget.farm) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('Farm details')
            .doc(farm.id)
            .collection('reported health issue')
            .get();
        querySnapshot.docs.forEach((doc) {
          issues.add(Issue.fromMap(doc.data() as Map<String, dynamic>, doc.id));
          getFarm.add(farm);
        });
      } catch (error) {
        print("no");
      }
    }
    return {'availableFarms': getFarm, 'issues': issues};
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
                child: Text('Cow'),
                value: 'Cow',
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

void signout(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Signed Out'),
        content: Text('Do you need to sign out.'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('YES'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen())); // Close the dialog
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
  final List<Farm> farm;
  final int index2;
  final List<Issue> issue;
  final int index;

  CustomCardWidget(this.farm, this.index2, this.issue, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(issue[index].timeDate,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(31, 42, 55, 1))),
            ),
            Divider(thickness: 2),
            SizedBox(height: 12),
            Row(children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(getImageAsset(issue[index]
                        .animaltype)), // Load the image from the database
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  Row(children: [
                    Text(
                      farm[index2].name, // Name  of the farm
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(width: 16),
                    Text(
                      issue[index].animalname, // from data the name of the cow
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ]),
                  SizedBox(
                    height: 12,
                  ),
                  Row(children: [
                    Text(
                      issue[index].animaltype,
                      style: TextStyle(fontSize: 14), // load type from database
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      issue[index].animalage + " Years",
                      style: TextStyle(fontSize: 14), // load from the data base
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(farm[index2]
                          .divisionalSecretariatArea) // divisional area
                    ],
                  ),
                ],
              )
            ]),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => vetAnimalIssue(
                                farm: farm,
                                index2: index2,
                                issue: issue,
                                index: index,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(300, 50)),
                child: Text(
                  "View Info",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  String getImageAsset(String name) {
    switch (name) {
      case "Cow":
        return 'assets/Cow.jpeg';
      case "Heifer":
        return 'assets/heifer.jpg';
      case "Calf-Male":
        return 'assets/mcalf.jpg';
      case "Bull":
        return 'assets/bull.jpg';
      default:
        return 'assets/fcalf.jpg';
    }
  }
}
