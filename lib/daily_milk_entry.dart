import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class dailyMilkEntry extends StatefulWidget {
  @override
  _dailyMilkEntryState createState() => _dailyMilkEntryState();
}

class _dailyMilkEntryState extends State<dailyMilkEntry> {
  bool isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _litercontroller = TextEditingController();
  TextEditingController _cowscontroller = TextEditingController();
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
        centerTitle: false,
        title: Text('Daily Milk Entry',
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
                              color: Color.fromRGBO(28, 42, 58, 1)),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        width: 350,
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
                            hintText: 'Date',
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
                          color: Color.fromRGBO(28, 42, 58, 1),
                        ),
                      ),
                      SizedBox(
                          height:
                              8), // Add some space between the text and the TextField
                      SizedBox(
                        height: 60,
                        width: 350,
                        child: TextField(
                          controller: _litercontroller,
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
                          color: Color.fromRGBO(28, 42, 58, 1),
                        ),
                      ),
                      SizedBox(
                          height:
                              8), // Add some space between the text and the TextField
                      SizedBox(
                        height: 60,
                        width: 350,
                        child: TextField(
                          controller: _cowscontroller,
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
                    backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    addMilkdata();
                  },
                  child: isLoading
                      ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submitting....  ',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                    ],
                  )
                      : const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Change the border radius as needed
                      side: BorderSide(
                          color:
                              Colors.black), // Add border side with red color
                    ), // Change the color as needed
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Animal()));
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addMilkdata() async {
    setState(() {
      isLoading = true;
    });

    String date = _selectedDate!.day.toString()+'/'+_selectedDate!.month.toString()+'/'+_selectedDate!.year.toString();
    String liters = _litercontroller.text;
    String cows = _cowscontroller.text;

    await FirebaseFirestore.instance
        .collection('Farm details/' + user!.uid + '/milk output')
        .doc()
        .set({
      'date': date,
      'liters': liters,
      'cows': cows,
      // Add more fields as needed
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      showToast("Added");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Animal()));
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      print("Failed to store data: $error");
    });
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
