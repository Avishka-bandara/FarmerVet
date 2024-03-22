import 'package:farmervet/vet_animal.dart';
import 'package:farmervet/vet_diagnose_helath.dart';
import 'package:farmervet/vet_reproduction.dart';
import 'package:flutter/material.dart';

import 'animalIssue.dart';
import 'farmList.dart';

class vetAnimalIssue extends StatefulWidget {
  final List<Farm> farm;
  final int index2;
  final List<Issue> issue;
  final int index;
  vetAnimalIssue(
      {required this.farm,
      required this.index,
      required this.issue,
      required this.index2});

  late Size screenSize;

  @override
  State<vetAnimalIssue> createState() => _vetAnimalIssueState();
}

class _vetAnimalIssueState extends State<vetAnimalIssue> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Animal Issue', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 1.0,
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(widget.issue[widget.index].animalname,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10.0),
                              Text(widget.farm[widget.index2].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Text(
                                  'Divisional Secretary : ' +
                                      widget.farm[widget.index2]
                                          .divisionalSecretariatArea,
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              SizedBox(width: 10.0),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Text(
                                  'Reported Time  : ' +
                                      widget.issue[widget.index].timeDate,
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              SizedBox(width: 10.0),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Text(
                                  'Email : ' + widget.farm[widget.index2].email,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10.0),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Farmer mentioned symptoms ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle first button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                        fixedSize: const Size(150, 50),
                      ),
                      child: Text(widget.issue[widget.index].animalissue,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Comments',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Comments If Added only"),
                SizedBox(height: 20.0),
                Text("View Added Images", style: TextStyle(fontSize: 18.0)),
                SizedBox(height: 10.0),
                Image.network(
                  widget.issue[widget.index].imageUrl,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                // load the image releted to issue
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Diagnose_health()), // navigate to vet_animal.dart
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(300, 50),
                  ),
                  child: Text('Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ),
                SizedBox(height: 20.0),
                OutlinedButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           vet_animal()), // navigate to vet_animal.dart
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: Text('Decline',
                      style: TextStyle(
                          color: Color.fromRGBO(28, 42, 58, 1),
                          fontSize: 16.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
