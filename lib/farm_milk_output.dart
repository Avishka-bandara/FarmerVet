import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'milkData.dart';
import 'milkData.dart';
import 'milkData.dart';

class totalMilkOutput extends StatefulWidget {

  final String id;
  totalMilkOutput({required this.id});

  @override
  _totalMilkOutputState createState() => _totalMilkOutputState();
}

class _totalMilkOutputState extends State<totalMilkOutput> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  late String _selectedDivision = '';

  @override
  void initState() {
    super.initState();
    // Initialize _selectedDate with a default value
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Farm Milk Output',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 42, 58, 1))),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Wrap(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            // Use Expanded to make the dropdown take remaining space
                            child: SizedBox(
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Year',
                                  border: OutlineInputBorder(),
                                ),
                                items: <String>[
                                  '2022',
                                  '2023',
                                  '2024',
                                  '2025',
                                  '2026',
                                  '2027',
                                ] // Add your list of years here
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // Handle dropdown value change
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  12), // Add space between dropdown and text field
                          Expanded(
                            // Use Expanded to make the text field take remaining space
                            child: SizedBox(
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Month',
                                  border: OutlineInputBorder(),
                                ),
                                items: <String>[
                                  'Jnauary',
                                  'February',
                                  'March',
                                  'April',
                                  'May',
                                  'June',
                                  'July',
                                  'August',
                                  'September',
                                  'October',
                                  'November',
                                  'December'
                                ] // Add your list of years here
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // Handle dropdown value change
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),

                    FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('Farm details/'+widget.id+'/milk output')
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
                          List<Milk> milk = [];
                          snapshot.data!.docs.forEach((doc) {
                            milk.add(Milk.fromMap(
                                doc.data() as Map<String, dynamic>, doc.id));
                          });
                          MilkList milkList = MilkList(milks: milk);
                          if (milk.isEmpty) {
                            return
                              Wrap(
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
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(75, 89, 99, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(4))),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Total For This Month : "+milkList.getTotalLitersthismonth().toString()+" L",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "Total : "+milkList.getTotalLiters().toString()+" L", // total milk quantity
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: screenSize.width,
                                  height: screenSize.height,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            DataTableExample(milk: milk),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}

class DataTableExample extends StatefulWidget {

  final List<Milk> milk;
  DataTableExample({Key? key, required this.milk}) : super(key: key);

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Date',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromRGBO(28, 42, 58, 1)),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Quantity(liters)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromRGBO(28, 42, 58, 1)),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Milked Cows',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromRGBO(28, 42, 58, 1)),
            ),
          ),
        ),
      ],
      rows:widget.milk.map((data) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(data.date)),
            DataCell(Text(data.liter)),
            DataCell(Text(data.cows)),
          ],
        );
      }).toList(),
    );
  }
}
