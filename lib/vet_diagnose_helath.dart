import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/vet_animal.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';
import 'add_animal.dart';
import 'animalIssue.dart';
import 'farmList.dart';

class Diagnose_health extends StatefulWidget {
  final List<Farm> farm;
  final int index2;
  final List<Issue> issue;
  final int index;

  Diagnose_health({
    required this.farm,
    required this.index,
    required this.issue,
    required this.index2,
  });
  @override
  State<Diagnose_health> createState() => _diagnose_health();
}

class _diagnose_health extends State<Diagnose_health> {
  late int _selectedRadio;
  bool isLoading = false;
  bool isSelectedlimping = false;
  bool isSelecteddiarhea = false;
  bool isSelectedfever = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select to Diagnose Health',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(children: [
            SizedBox(height: 10),
            Text(
              "Specify a health issue based on animal condition mentioned by farmer",
              style: TextStyle(
                  color: Color.fromRGBO(107, 114, 128, 1), fontSize: 18),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            Column(
              children: [
                Card(
                  elevation: 3.0,
                  margin: EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: isSelectedlimping
                                        ? Colors.deepPurple
                                        : Colors.white),
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      // _selectedIssue = 'Limping';
                                      isSelectedlimping = true;
                                      isSelecteddiarhea = false;
                                      isSelectedfever = false;
                                    });
                                  },
                                  child: Text('Limping',
                                      style: isSelectedlimping
                                          ? TextStyle(color: Colors.white)
                                          : TextStyle()),
                                ),
                              ),

                              SizedBox(
                                  width: 10), // Add spacing between buttons

                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: isSelecteddiarhea
                                        ? Colors.deepPurple
                                        : Colors.white),
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      // _selectedIssue = 'Diarrhea';
                                      isSelectedlimping = false;
                                      isSelecteddiarhea = true;
                                      isSelectedfever = false;
                                    });
                                  },
                                  child: Text('Diarrhea',
                                      style: isSelecteddiarhea
                                          ? TextStyle(color: Colors.white)
                                          : TextStyle()),
                                ),
                              ),

                              SizedBox(
                                  width: 10), // Add spacing between buttons

                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: isSelectedfever
                                        ? Colors.deepPurple
                                        : Colors.white),
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      // _selectedIssue = 'Fever';
                                      isSelectedlimping = false;
                                      isSelecteddiarhea = false;
                                      isSelectedfever = true;
                                    });
                                  },
                                  child: Text('Fever',
                                      style: isSelectedfever
                                          ? TextStyle(color: Colors.white)
                                          : TextStyle()),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                          /*Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(
                                    28, 42, 58, 1); // Change color when pressed
                              }
                              return Colors.white; // Default color
                            },
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                                color: Color.fromRGBO(28, 42, 58, 1),
                                width: 1.0),
                          ),
                        ),
                        onPressed: () {
                          // Functionality for the first button
                        },
                        child: Text(
                          "Symptom",
                          style:
                              TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                        ),
                      ),

                      SizedBox(width: 10), // Add spacing between buttons

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(
                                    28, 42, 58, 1); // Change color when pressed
                              }
                              return Colors.white; // Default color
                            },
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                                color: Color.fromRGBO(28, 42, 58, 1),
                                width: 1.0),
                          ),
                        ),
                        onPressed: () {
                          // Functionality for the second button
                        },
                        child: Text(
                          "Symptom",
                          style:
                              TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                        ),
                      ),

                      SizedBox(width: 10), // Add spacing between buttons

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(
                                    28, 42, 58, 1); // Change color when pressed
                              }
                              return Colors.white; // Default color
                            },
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                                color: Color.fromRGBO(28, 42, 58, 1),
                                width: 1.0),
                          ),
                        ),
                        onPressed: () {
                          // Functionality for the third button
                        },
                        child: Text(
                          "Symptom",
                          style:
                              TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                        ),
                      ),
                    ],
                  ), */ // Add some space between the rows
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Card(
              elevation: 5.0,
              margin: EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [Text("Choose:")],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                _selectedRadio = value as int;
                              });
                            },
                            activeColor: Color.fromRGBO(28, 42, 58, 1),
                          ),
                          Text("Requires immediate visit to farm"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                _selectedRadio = value as int;
                              });
                            },
                            activeColor: Color.fromRGBO(28, 42, 58, 1),
                          ),
                          Text("Does not require visit"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: _selectedRadio == 2,
                        // Show label when radio button with value 1 is selected
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(254, 176, 82, 1),
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the radius as needed
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              // Adjust padding as needed
                              child: Text(
                                'Minor Issue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: _selectedRadio == 2,
                        // Show label when radio button with value 1 is selected
                        child: Text(
                          '** Please advice the farmer by contacting them ',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(28, 42, 58, 1)),
              ),
              onPressed: () {
                register(); // Replace 'argument' with the actual argument value.
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
          ]),
        ),
      ),
    );
  }

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    DocumentReference sourceDocRef = FirebaseFirestore.instance
        .collection('Farm details/' +
            widget.farm[widget.index2].id +
            '/reported health issue')
        .doc(widget.issue[widget.index].id);
    DocumentReference destinationDocRef = FirebaseFirestore.instance
        .collection(
            'Farm details/' + widget.farm[widget.index2].id + '/health issue')
        .doc(widget.issue[widget.index].id);

    DocumentSnapshot sourceSnapshot = await sourceDocRef.get();
    await destinationDocRef
        .set(sourceSnapshot.data() ?? {})
        .then((value) async {
      print("cloned");
      if (isSelectedlimping) {
        String? issue = 'Limping';
        FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/health issue/')
            .doc(widget.issue[widget.index].id)
            .update({
              'animalissue': issue,
              // Add other fields to update as needed
            })
            .then((_) => deleteDocumentissue())
            .catchError((error) => print('Error updating document: $error'));
      } else if (isSelecteddiarhea) {
        String? issue = 'Diarrhea';
        FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/health issue/')
            .doc(widget.issue[widget.index].id)
            .update({
              'animalissue': issue,
              // Add other fields to update as needed
            })
            .then((_) => deleteDocumentissue())
            .catchError((error) => print('Error updating document: $error'));
      } else if (isSelectedfever) {
        String? issue = 'Fever';
        FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/health issue/')
            .doc(widget.issue[widget.index].id)
            .update({
              'animalissue': issue,
              // Add other fields to update as needed
            })
            .then((_) => deleteDocumentissue())
            .catchError((error) => print('Error updating document: $error'));
      }

      if (_selectedRadio == 2) {
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/health issue')
            .doc(widget.issue[widget.index].id);
        await documentReference.update({
          'visit': false,
        }).then((value) async {
          setState(() {
            isLoading = false;
          });

          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('Farm visit')
              .doc(widget.farm[widget.index2].id +
                  widget.issue[widget.index].id);
          await documentReference.delete().then((value) {
            print('Document deleted successfully!');
            showToast("Saved");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => vet_animal(widget.farm)));
          }).catchError((error) {
            setState(() {
              isLoading = false;
            });
            print("Failed to store data: $error");
          });
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
          print("Failed to store data: $error");
        });
      } else if (_selectedRadio == 1) {
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/health issue')
            .doc(widget.issue[widget.index].id);
        await documentReference.update({
          'visit': true,
        }).then((value) async {
          await FirebaseFirestore.instance
              .collection('Farm visit')
              .doc(
                  widget.farm[widget.index2].id + widget.issue[widget.index].id)
              .set({
            'issue': widget.issue[widget.index].id,
            'timeDate': widget.issue[widget.index].timeDate,
            'farmName': widget.farm[widget.index2].name,
            'location': widget.farm[widget.index2].area,
            'email': widget.farm[widget.index2].email,
            'cowname': widget.issue[widget.index].animalname,
            // Add more fields as needed
          }).then((value) {
            setState(() {
              isLoading = false;
            });
            showToast("Saved");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => vetAnimalIssue(
                          index: widget.index,
                          index2: widget.index2,
                          farm: widget.farm,
                          issue: widget.issue,
                        )));
          }).catchError((error) {
            setState(() {
              isLoading = false;
            });
            print("Failed to store data: $error");
          });
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
          print("Failed to store data: $error");
        });
      }
    });
  }

  Future<void> deleteDocumentissue() async {
    try {
      await FirebaseFirestore.instance
          .collection('Farm details/' +
              widget.farm[widget.index2].id +
              '/reported health issue')
          .doc(widget.issue[widget.index].id)
          .delete();
      print('Document deleted successfully.');
    } catch (e) {
      print('Error deleting document: $e');
    }
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
