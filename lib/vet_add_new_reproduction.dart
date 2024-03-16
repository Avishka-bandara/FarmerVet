import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';

class ReproductionEntry extends StatefulWidget {
  @override
  _ReproductionEntryState createState() => _ReproductionEntryState();
}

class _ReproductionEntryState extends State<ReproductionEntry> {
  String? selectedValue;
  String? selectedValue_1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Reproduction Entry',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(children: [
            SizedBox(height: 20),
            CustomCardWidget(),
            SizedBox(height: 35),
            Text(
              "Select Service",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomDropdownField(
              hintText: '1st Service',
              items: ['Option 1', 'Option 2', 'Option 3'],
              // List of dropdown items
              value: selectedValue,
              // Pass the selected value
              onChanged: (newValue) {
                // Handle the value change
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
            SizedBox(height: 35),
            Text(
              "Select Reproduction Stage",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomDropdownField(
              hintText: "choose",
              items: [
                'Set as inseminated',
                'Set as pregnant',
                'Gave birth',
                'Pregnanacy failed'
              ],
              value: selectedValue_1,
              onChanged: (newValue) {
                setState(() {
                  selectedValue_1 = newValue!;
                });
              },
            ),
            SizedBox(height: 35),
            Text(
              "Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            DatePickerFormField(),
          ]),
        ),
      ),
    );
  }
}

// custom card widget
//
class CustomCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.only(top: 10.0),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cow 1",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Divider(thickness: 1),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 330,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/cow.jpg'),
                          // Load image from the database
                          fit: BoxFit.cover,
                          alignment: Alignment
                              .center // Ensures the image covers the entire container
                          ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Align children to the end (right side)
                    children: [
                      Text("Tag Number:", textAlign: TextAlign.right),
                      Text("Age:", textAlign: TextAlign.right),
                      Text("Breed Type:", textAlign: TextAlign.right),
                      //these information should be retrieved from the database
                    ],
                  )
                ],
              ),
              // Add some space between the rows
            ],
          ),
        ),
      ),
    );
  }
}

//input field
class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const CustomDropdownField({
    Key? key,
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hintText),
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}

class DatePickerFormField extends StatefulWidget {
  @override
  _DatePickerFormFieldState createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'Select Date'
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
