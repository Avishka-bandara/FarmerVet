import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CowList.dart';
import 'farmList.dart';



class vet_reproduction extends StatefulWidget {

  final List<Cow> cows;
  final int index;
  final List<Farm> farm;
  final int index2;

  const vet_reproduction({super.key,required this.cows, required this.index,required this.farm, required this.index2});

  @override
  State<vet_reproduction> createState() => _vet_reproductionState();
}

class _vet_reproductionState extends State<vet_reproduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Reproduction',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 42, 58, 1))),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),

          ExpansionTile(
            title: Text('Session 1',
                style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),

            children: <Widget>[
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('Farm details/' +
                    widget.farm[widget.index2].id +
                    '/animal details/' + widget.cows[widget.index].id +
                    '/breeding details').doc('1st Service').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      ListTile(
                        title: Text('Inseminated Date: ${data['inseminateddate']==null?'Failed':data['inseminateddate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                      ListTile(
                        title: Text('Pregnant Diagnosis: ${data['pregnantdate']==null?'Failed':data['pregnantdate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                      ListTile(
                        title: Text('Birth Date: ${data['Birthdate']==null?'Failed':data['Birthdate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),

          Divider(
            thickness: 2,
          ),
          ExpansionTile(
            title: Text('Session 2',
                style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),

            // The content that expands or collapses
            children: <Widget>[
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('Farm details/' +
                    widget.farm[widget.index2].id +
                    '/animal details/' + widget.cows[widget.index].id +
                    '/breeding details').doc('2nd Service').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    showToast("message");
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      ListTile(
                        title: Text('Inseminated Date: ${data['inseminateddate']==null?'Failed':data['inseminateddate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                      ListTile(
                        title: Text('Pregnant Diagnosis: ${data['pregnantdate']==null?'Failed':data['pregnantdate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                      ListTile(
                        title: Text('Birth Date: ${data['Birthdate']==null?'Failed':data['Birthdate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          ExpansionTile(
            title: Text('Session 3',
                style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),

            // The content that expands or collapses
            children: <Widget>[
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('Farm details/' +
                    widget.farm[widget.index2].id +
                    '/animal details/' + widget.cows[widget.index].id +
                    '/breeding details').doc('3rd Service').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      ListTile(
                        title: Text('Inseminated Date: ${data['inseminateddate']==null?'Failed':data['inseminateddate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                      ListTile(
                        title: Text('Pregnant Diagnosis: ${data['pregnantdate']==null?'Failed':data['pregnantdate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                      ListTile(
                        title: Text('Birth Date: ${data['Birthdate']==null?'Failed':data['Birthdate']}',
                            style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          // Add more ExpansionTile widgets as needed
        ],
      ),
    );
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
