import 'package:flutter/material.dart';

class ReportAnimal extends StatefulWidget {
  @override
  _ReportAnimalState createState() => _ReportAnimalState();
}

class _ReportAnimalState extends State<ReportAnimal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Animal Issue'),
        centerTitle: true,
      ),
      body: Text('Report Animal Issue'),
    );
  }
}
