import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Animal(),
    );
  }
}

class Animal extends StatefulWidget {
  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  @override
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
                  Get.to(dailyMilkEntry());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  // Change the color as needed
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
                  Get.to(totalMilkOutput());
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
                      // navigate to the AddAnimalwidget
                    },
                  ),
                  ListTile(
                    title: Text('Farm milk output'),
                    onTap: () {
                      //navigate to the farmer
                    },
                  ),
                  ListTile(
                    title: Text('Account'),
                    onTap: () {
                      Get.to(() => Animal());
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
                //Loging from the account;
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

//
// custom card widget
//
class CustomCardWidget extends StatelessWidget {
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
                        'Cow 1', // Replace with the actual name from the database
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
                              'Bull',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(width: 140),
                            Text(
                              '6 Months', // Replace with the actual age from the database
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ]),
                      SizedBox(height: 5),
                      Text(
                        'Health Issue', // Replace with the actual health issue from the database
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ])),
              ],
            ),
          ),
        ));
  }
}
