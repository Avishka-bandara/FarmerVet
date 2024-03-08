import 'package:flutter/material.dart';

class dailyMilkEntry extends StatefulWidget {
  @override
  _dailyMilkEntryState createState() => _dailyMilkEntryState();
}

class _dailyMilkEntryState extends State<dailyMilkEntry> {
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
        centerTitle:false,
        title: Text('Daily Milk Entry'),
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
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
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
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Milk Output Today',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8), // Add some space between the text and the TextField
                      SizedBox(
                        height: 45,
                        width: 350,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'in Liters',
                            border: OutlineInputBorder(),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Cows',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8), // Add some space between the text and the TextField
                      SizedBox(
                        height: 45,
                        width: 350,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Cows milked',
                            border: OutlineInputBorder(),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 80),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color.fromRGBO(28, 42, 58, 1),
                    fixedSize:
                    const Size(300, 50), // Change the color as needed
                  ),
                  onPressed: () {
                  },
                  child: Text(
                      'Submit',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1)
                    ),),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    fixedSize:
                    const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Change the border radius as needed
                      side: BorderSide(color: Colors.black), // Add border side with red color
                    ),// Change the color as needed
                  ),
                  onPressed: () {
                  },
                  child: Text(
                      'Cancel',
                       style: TextStyle(
                        color: Color.fromRGBO(28, 42, 58, 1)
                       ),
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



void main() {
  runApp(MaterialApp(
    home: dailyMilkEntry(),
  ));
}
