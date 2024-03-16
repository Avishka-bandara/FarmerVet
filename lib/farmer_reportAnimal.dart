import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  ReportAnimal({required this.cows,required this.index});

  @override
  State<ReportAnimal> createState() => _ReportAnimalState();
}

class _ReportAnimalState extends State<ReportAnimal> {
  String _currentDateTime = '';
  bool isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;
  String? _selectedIssue;
  final TextEditingController issuecontroller = TextEditingController();

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
                    OutlinedButton(
                      onPressed: (){
                        setState(() {
                          _selectedIssue = 'Limping';
                        });
                      },
                      child: Text('Limping'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        _selectedIssue = 'Diarrhea';
                      },
                      child: Text('Diarrhea'),
                    ),
                    OutlinedButton(
                      onPressed: (){
                        _selectedIssue = 'Fever';
                        showToast(_selectedIssue!);
                      },
                      child: Text('Fever'),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 1; i <= 3; i++)
                      OutlinedButton(
                        onPressed: () => print('Symptoms $i'),
                        child: Text('Symptoms'),
                      ),
                  ],
                )
              ],
            ),
              SizedBox(height: 10),
              TextField(
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
              ImagePickerWidget(),
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

  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateFormat('yyyy-MM-dd - HH:mm').format(DateTime.now());
    });
  }

  Future<void> register() async {
    _updateDateTime();
    setState(() {
      isLoading = true;
    });

    String? issue;
    _selectedIssue==null?issue=issuecontroller.text: issue=_selectedIssue;

    await FirebaseFirestore.instance
        .collection('Farm details/' +user!.uid +'/health issue')
        .doc()
        .set({
      'animal id':widget.cows[widget.index].id,
      'animalissue': _selectedIssue,
      'timeDate':_currentDateTime,
      'cowname':widget.cows[widget.index].name,
      'cowtype':widget.cows[widget.index].type,
      'cowage':widget.cows[widget.index].age,
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

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? _imagePath;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

}
