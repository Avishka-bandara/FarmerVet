import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'farmer_animal.dart';

class ReportAnimal extends StatelessWidget {
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
              IssueButtons(),
              SizedBox(height: 10),
              TextField(
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Animal()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(28, 42, 58, 1),
            ),
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
    );
  }
}

class IssueButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                print('Limping');
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black.withOpacity(1); // Color when pressed
                    }
                    return Colors.red.withOpacity(1); // Default color
                  },
                ),
              ),
              child: Text('Limping'),
            ),

            OutlinedButton(
              onPressed: () => print('Diarrhea'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black.withOpacity(1); // Color when pressed
                    }
                    return Colors.red.withOpacity(1); // Default color
                  },
                ),
              ),
              child: Text('Diarrhea'),
            ),
            OutlinedButton(
              onPressed: () => print('Fever'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black.withOpacity(1); // Color when pressed
                    }
                    return Colors.red.withOpacity(1); // Default color
                  },
                ),
              ),
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
