//import 'package:farmervet/vet_reproduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';
import 'package:farmervet/vet_add_new_reproduction.dart';

import 'add_animal.dart';

class BreedingInfo extends StatefulWidget {
  @override
  State<BreedingInfo> createState() => _BreedingInfoState();
}

class _BreedingInfoState extends State<BreedingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Breeding Info',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(children: [
            SizedBox(height: 20),
            Text(
              "Update reproduction status for each cow in the farm.",
              style: TextStyle(
                  color: Color.fromRGBO(107, 114, 128, 1), fontSize: 18),
            ),
            SizedBox(height: 10),
            CustomSearchBar(),
            SizedBox(height: 10),
            CustomCardWidget(),
          ]),
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
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/cow.jpg'),
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
                        Text(
                          'Cow 1',
                          // Replace with the actual name from the database
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
                              'Heifer',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(width: 140),
                            Text(
                              '6 Months',
                              // Replace with the actual age from the database
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Add some space between the rows
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                              color: Color.fromRGBO(28, 42, 58, 1), width: 1.0),
                        ),
                      ),
                      onPressed: () {
                        // Functionality for the first button
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReproductionEntry()),
                        );
                      },
                      child: Text(
                        "Add Info",
                        style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(28, 42, 58, 1),
                        ),
                      ),
                      onPressed: () {
                        // Functionality for the second button
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => vet_reproduction()),
                        // );
                      },
                      child: Text(
                        "View Reproduction",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
