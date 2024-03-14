import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:farmervet/add_animal.dart';

import 'firebase_auth_services.dart';

class addAnimalForm extends StatefulWidget {
  @override
  _addAnimalFormState createState() => _addAnimalFormState();
}

class _addAnimalFormState extends State<addAnimalForm> {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController animalType = TextEditingController();
  TextEditingController animalName = TextEditingController();
  TextEditingController animalTag = TextEditingController();
  TextEditingController animalBreed = TextEditingController();
  TextEditingController age = TextEditingController();
  late DateTime? _selectedDate;
  bool isLoading = false;

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
                          controller: animalName,
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
                          controller: animalTag,
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
                          controller: animalBreed,
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
                          controller: age,
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
                      register();
                    },
                    child: isLoading
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Registering....  ',
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

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    String animaltype = animalType.text;
    String animalname = animalName.text;
    String tag = animalTag.text;
    String breed = animalBreed.text;
    String dateofBirth = (_selectedDate!.day).toString() +
        "/" +
        (_selectedDate!.month).toString() +
        "/" +
        (_selectedDate!.year).toString();
    String animalAge = age.text;

    await FirebaseFirestore.instance
        .collection('Farm details/' + user!.uid + '/animal details')
        .doc()
        .set({
      'animaltype': animaltype,
      'animalname': animalname,
      'tag': tag,
      'breed': breed,
      'dateofBirth': dateofBirth,
      'animalAge': animalAge
      // Add more fields as needed
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      showToast("Registered Successfully");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Animal()));
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
