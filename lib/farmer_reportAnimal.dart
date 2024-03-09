import 'package:flutter/material.dart';

class ReportAnimal extends StatefulWidget {
  @override
  _ReportAnimalState createState() => _ReportAnimalState();
}

class _ReportAnimalState extends State<ReportAnimal> {
  String? selectedIssue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Animal Issue',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Select the animal issue here',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              IssueButtons(onIssueSelected: (issue) {
                setState(() {
                  selectedIssue = issue;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

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

void main() {
  runApp(MaterialApp(
    home: ReportAnimal(),
  ));
}
