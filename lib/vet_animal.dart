import 'package:farmervet/add_animal.dart';
import 'package:farmervet/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';

class vet_animal extends StatefulWidget {
  @override
  State<vet_animal> createState() => _vet_animalState();
}

class _vet_animalState extends State<vet_animal> {
  @override
  void initState() {
    super.initState();
    // Initialize controller values for testing
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
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
            Text(
              'Today',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomCardWidget(),
          ]),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addAnimalForm()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Farm milk output'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => totalMilkOutput()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Account'),
                    onTap: () {
                      Get.to(() => vet_animal());
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
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AnimalDetail())),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("22 MAY 2024 - 10:00 AM",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(31, 42, 55, 1))),
                Divider(thickness: 2),
                SizedBox(height: 12),
                Row(children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/cow.jpg'), // Load the image from the database
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Farm 1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Cow 1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ]),
                SizedBox(width: 10),
                /* Expanded(
                    ),*/
              ],
            ),
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: vet_animal(),
  ));
}