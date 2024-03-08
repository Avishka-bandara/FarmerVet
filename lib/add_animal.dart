import 'package:flutter/material.dart';

class addAnimalForm extends StatefulWidget {
  @override
  _addAnimalFormState createState() => _addAnimalFormState();
}

class _addAnimalFormState extends State<addAnimalForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  late String _selectedDivision='';
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
        centerTitle:true,
        title: Text('Add Animal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Animal Type',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Animal Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Animal Tag Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:20),

                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Breed',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      readOnly: true,
                      controller: TextEditingController(
                          text: _selectedDate == null
                              ? ''
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      ),
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color.fromRGBO(28, 42, 58, 1),
                    fixedSize:
                    const Size(300, 50), // Change the color as needed
                  ),
                  onPressed: () {
                    _showRegistrationSuccessfulDialog(context);
                  },
                  child: Text('Register'),
                ),
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
