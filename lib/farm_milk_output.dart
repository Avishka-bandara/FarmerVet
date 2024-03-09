import 'package:flutter/material.dart';
import 'package:get/get.dart';

class totalMilkOutput extends StatefulWidget {
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
        centerTitle: false,
        title: Text('Farm Milk Output',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Row(
                    // Use Row instead of Column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // Use Expanded to make the dropdown take remaining space
                        child: SizedBox(
                          height: 45,
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
                              '2026'
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
                          height: 45,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*void main() {
  runApp(MaterialApp(
    home: totalMilkOutput(),
  ));
}*/
