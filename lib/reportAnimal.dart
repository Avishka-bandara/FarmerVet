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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Select the animal issue here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReportIssueButton(
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                  // Add other buttons or widgets here
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Add other buttons or widgets here
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportIssueButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ReportIssueButton({Key, required this.onPressed}) : super();

  @override
  _ReportIssueButtonState createState() => _ReportIssueButtonState();
}

class _ReportIssueButtonState extends State<ReportIssueButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _isPressed = true;
            widget.onPressed();
          });
          Future.delayed(Duration(milliseconds: 200), () {
            setState(() {
              _isPressed = false;
            });
          });
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered) && !_isPressed) {
                return Color.fromRGBO(
                    28, 42, 58, 0.1); // Adjust the color for hover effect
              }
              return Colors.transparent;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: _isHovered || _isPressed
                    ? Colors.black
                    : Color.fromRGBO(28, 42, 58, 1),
              ),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Report Issue',
            style: TextStyle(
              fontSize: 14,
              color: _isHovered || _isPressed
                  ? Colors.black
                  : Color.fromRGBO(28, 42, 58, 1),
            ),
          ),
        ),
      ),
    );
  }
}
