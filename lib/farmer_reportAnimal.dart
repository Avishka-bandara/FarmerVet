import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'CowList.dart';
import 'farmer_animal.dart';

class ReportAnimal extends StatefulWidget {
  final List<Cow> cows;
  final int index;
  ReportAnimal({required this.cows, required this.index});

  @override
  State<ReportAnimal> createState() => _ReportAnimalState();
}

class _ReportAnimalState extends State<ReportAnimal> {
  String _currentDateTime = '';
  bool isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;
  String? _selectedIssue = '';
  final TextEditingController issuecontroller = TextEditingController();
  String? _imagePath;
  String imageUrl = '';
  bool isSelectedlimping = false;
  bool isSelecteddiarhea = false;
  bool isSelectedfever = false;
  bool isSelectedsimptom1 = false;
  bool isSelectedsimptom2 = false;
  bool isSelectedsimptom3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report Animal Issue',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select the animal issue here',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              _selectedIssue = 'Limping';
                              isSelectedlimping = true;
                              isSelecteddiarhea = false;
                              isSelectedfever = false;
                              isSelectedsimptom1 = false;
                              isSelectedsimptom2 = false;
                              isSelectedsimptom3 = false;
                            });
                          },
                          child: Text('Limping',
                              style: isSelectedlimping
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle()),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelecteddiarhea
                                ? Colors.deepPurple
                                : Colors.white),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIssue = 'Diarrhea';
                              isSelectedlimping = false;
                              isSelecteddiarhea = true;
                              isSelectedfever = false;
                              isSelectedsimptom1 = false;
                              isSelectedsimptom2 = false;
                              isSelectedsimptom3 = false;
                            });
                          },
                          child: Text('Diarrhea',
                              style: isSelecteddiarhea
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle()),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelectedfever
                                ? Colors.deepPurple
                                : Colors.white),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIssue = 'Fever';
                              isSelectedlimping = false;
                              isSelecteddiarhea = false;
                              isSelectedfever = true;
                              isSelectedsimptom1 = false;
                              isSelectedsimptom2 = false;
                              isSelectedsimptom3 = false;
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
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelectedsimptom1
                                ? Colors.deepPurple
                                : Colors.white),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIssue = 'Simptom 1';
                              isSelectedlimping = false;
                              isSelecteddiarhea = false;
                              isSelectedfever = false;
                              isSelectedsimptom1 = true;
                              isSelectedsimptom2 = false;
                              isSelectedsimptom3 = false;
                            });
                          },
                          child: Text('Simptom 1',
                              style: isSelectedsimptom1
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle()),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelectedsimptom2
                                ? Colors.deepPurple
                                : Colors.white),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIssue = 'Simptom 2';
                              isSelectedlimping = false;
                              isSelecteddiarhea = false;
                              isSelectedfever = false;
                              isSelectedsimptom1 = false;
                              isSelectedsimptom2 = true;
                              isSelectedsimptom3 = false;
                            });
                          },
                          child: Text('Simptom 2',
                              style: isSelectedsimptom2
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle()),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelectedsimptom3
                                ? Colors.deepPurple
                                : Colors.white),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIssue = 'Simptom 3';
                              isSelectedlimping = false;
                              isSelecteddiarhea = false;
                              isSelectedfever = false;
                              isSelectedsimptom1 = false;
                              isSelectedsimptom2 = false;
                              isSelectedsimptom3 = true;
                            });
                          },
                          child: Text('Simptom 3',
                              style: isSelectedsimptom3
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle()),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                onTap: () {
                  setState(() {
                    _selectedIssue = '';
                    isSelectedlimping = false;
                    isSelecteddiarhea = false;
                    isSelectedfever = false;
                  });
                },
                controller: issuecontroller,
                decoration: InputDecoration(
                  helperText: 'Ex: Cow is lazy, not eating, dull eyes',
                  hintText: "optional",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 150, // Adjust height as needed
                width: double.infinity, // Take full width
                child: Stack(
                  children: [
                    if (_imagePath != null)
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.file(
                            File(_imagePath!),
                            height: 100,
                            width: 100,
                          ),
                          IconButton(
                            icon: Icon(Icons.cancel_outlined),
                            onPressed: () {
                              setState(() {
                                _imagePath = null;
                              });
                            },
                          ),
                        ],
                      ),
                    if (_imagePath == null)
                      ElevatedButton(
                        onPressed: _pickImageFromGallery,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                          fixedSize: const Size(200, 45),
                        ),
                        child: Text(
                          'Add Image',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Animal()));
              register();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(28, 42, 58, 1),
            ),
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
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }

  void _updateDateTime() {
    setState(() {
      _currentDateTime =
          DateFormat('yyyy-MM-dd - HH:mm').format(DateTime.now());
    });
  }

  Future<void> register() async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);

    _updateDateTime();
    setState(() {
      isLoading = true;
    });

    String? issue = '';
    _selectedIssue == ''
        ? issue = issuecontroller.text
        : issue = _selectedIssue;

    if (issue == '') {
      showToast("Please select or type a symptom");
      setState(() {
        isLoading = false;
      });
      return;
    } else if (_imagePath == null) {
      showToast("Please add an image");
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      await referenceImageToUpload
          .putFile(File(_imagePath!))
          .then((p0) => null);
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {
      showToast(error.toString());
      print('Error uploading image: $error');
    }

    await FirebaseFirestore.instance
        .collection('Farm details/' + user!.uid + '/reported health issue')
        .doc()
        .set({
      'animal id': widget.cows[widget.index].id,
      'animalissue': issue,
      'timeDate': _currentDateTime,
      'cowname': widget.cows[widget.index].name,
      'cowtype': widget.cows[widget.index].type,
      'cowage': widget.cows[widget.index].age,
      'imageurl': imageUrl,
      'visit': true,
      // Add more fields as needed
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      showToast("Saved");
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
