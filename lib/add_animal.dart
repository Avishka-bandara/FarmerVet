import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:farmervet/add_animal.dart';

class addAnimalForm extends StatefulWidget {
  @override
  _addAnimalFormState createState() => _addAnimalFormState();
}

class _addAnimalFormState extends State<addAnimalForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  late String _selectedDivision = '';
  late DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize _selectedDate with a default value
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Animal',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(28, 42, 58, 1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            labelText: 'Animal Type',
                            border: OutlineInputBorder(),
                          ),
                          items: <String>[
                            'Bull',
                            'Heifer',
                            'Calf-Male',
                            'Calf-Female',
                          ].map<DropdownMenuItem<String>>((String items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                          },
                        ),
                      ),
                    ),
                    Text("Animal Name"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Animal Name',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            //prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),
                    Text("Animal Tag Number (Tag No)"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Animal Tag Number',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            // prefixIcon: Icon(Icons.tag_outlined),
                          ),
                        ),
                      ),
                    ),
                    Text("Breed"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Breed',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            //prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),
                    Text("Date of Birth"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextFormField(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null &&
                                pickedDate != _selectedDate) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            }
                          },
                          readOnly: true,
                          controller: TextEditingController(
                              text: _selectedDate == null
                                  ? ''
                                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Date of Birth',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            prefixIcon: Icon(Icons.calendar_today_outlined),
                          ),
                        ),
                      ),
                    ),
                    Text("Age"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Age',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            //prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 48,
                  width: 342,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                      fixedSize:
                          const Size(300, 50), // Change the color as needed
                    ),
                    onPressed: () {
                      _showRegistrationSuccessfulDialog(context);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showRegistrationSuccessfulDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Registration Successful'),
        content: Text('Your registration has been successfully submitted.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void main() {
  runApp(MaterialApp(
    home: addAnimalForm(),
  ));
}
