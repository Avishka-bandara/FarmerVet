import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:farmervet/farmer_animal.dart';
import 'package:get/get.dart';


class ReportAnimal extends StatefulWidget {
  @override
  _ReportAnimalState createState() => _ReportAnimalState();
}

class _ReportAnimalState extends State<ReportAnimal> {
  String? selectedIssue;
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
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Report Animal Issue',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select the animal issue here',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                IssueButtons(onIssueSelected: (issue) {
                  setState(() {
                    selectedIssue = issue;
                  });
                }),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    helperText: 'Ex: Cow is lazy, not eating , dull eyes ',
                    labelText: 'Optional',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImagePickerWidget(),
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
                Get.to(Animal());
                // the ata should be sent to the database and appear on the  vet new health problem screen
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(28, 42, 58, 1)),
              child: Text(
                'Submit ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// the issues button set up
//
class IssueButtons extends StatefulWidget {
  final Function(String) onIssueSelected;

  const IssueButtons({Key? key, required this.onIssueSelected})
      : super(key: key);

  @override
  State<IssueButtons> createState() => _IssueButtonsState();
}

class _IssueButtonsState extends State<IssueButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () => widget.onIssueSelected('Limping'),
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Limping',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(28, 42, 58, 1),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => widget.onIssueSelected('Diarrhea'),
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Diarrhea',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(28, 42, 58, 1),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => widget.onIssueSelected('Fever'),
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Fever',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(28, 42, 58, 1),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () => widget.onIssueSelected('Symptoms1'),
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Symptoms',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(28, 42, 58, 1),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => widget.onIssueSelected('Symptoms2'),
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Symptoms',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(28, 42, 58, 1),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => widget.onIssueSelected('Symptoms3'),
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Symptoms',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(28, 42, 58, 1),
                ),
              ),
            ),
          ],
        )
      ],
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    primary: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(200, 45),
                  ),
                  child: Text(
                    'Add Image or Video',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReportAnimal(),
  ));
}
