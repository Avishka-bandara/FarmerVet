import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';

/*void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ReproductionEntry(),
    );
  }
}*/

class ReproductionEntry extends StatefulWidget {
  @override
  _ReproductionEntryState createState() => _ReproductionEntryState();
}

class _ReproductionEntryState extends State<ReproductionEntry> {
  String? selectedValue_1;
  DateTime? selectedDate;
  String? selectedValue;
  late int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    var _selectedRadio;
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

            SizedBox(
              child: CustomDropdownField(
                hintText: "choose",
                items: [
                  'Set as inseminated',
                  'Set as pregnant',
                  'Gave birth',
                  'Pregnancy failed'
                ],
                value: selectedValue_1,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue_1 = newValue!;
                    // Reset selected date when changing dropdown value
                    selectedDate = null;
                  });
                },
              ),
            ),
            if (selectedValue_1 == 'Gave birth') SizedBox(height: 30),
            if (selectedValue_1 == 'Gave birth')
              Text(
                "Date of Birth",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (selectedValue_1 == 'Gave birth') DatePickerFormField(),
            SizedBox(height: 20),
            if (selectedValue_1 == 'Gave birth')
              Text(
                'Calf NO./Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (selectedValue_1 == 'Gave birth')
              SizedBox(
                height: 60,
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            if (selectedValue_1 == 'Gave birth') SizedBox(height: 20),

            if (selectedValue_1 == 'Gave birth')
              Text(
                "Calf Gender",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (selectedValue_1 == 'Gave birth')
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'choose',
                  border: OutlineInputBorder(),
                ),
                items: <String>[
                  'Male',
                  'Female',
                ] // Add your list of years here
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                },
              ),
            if (selectedValue_1 == 'Set as pregnant') SizedBox(height: 30),

            // Conditionally render date input field if 'Set as inseminated' is selected
            if (selectedValue_1 == 'Set as pregnant')
              Text(
                "Date of birth",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 10),

            if (selectedValue_1 == 'Set as pregnant') DatePickerFormField(),
            if (selectedValue_1 == 'Pregnancy failed') SizedBox(height: 20),

            // Conditionally render date input field if 'Set as inseminated' is selected
            if (selectedValue_1 == 'Pregnancy failed')
              Text(
                "Date of diagnosis",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 10),

            if (selectedValue_1 == 'Pregnancy failed') DatePickerFormField(),
            SizedBox(height: 10),
            if (selectedValue_1 == 'Set as inseminated')
              Text(
                "Date of Insemination",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 10),

            if (selectedValue_1 == 'Set as inseminated') DatePickerFormField(),
            SizedBox(height: 30),
            if (selectedValue_1 == 'Set as inseminated')
              Text(
                "Method of Insemination",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (selectedValue_1 == 'Set as inseminated')
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value as int;
                      });
                    },
                    activeColor: Color.fromRGBO(28, 42, 58, 1),
                  ),
                  Text("AI"),
                  SizedBox(width: 50),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value as int;
                      });
                    },
                    activeColor: Color.fromRGBO(28, 42, 58, 1),
                  ),
                  Text("Bull"),
                ],
              ),
            SizedBox(height: 20),
            if (selectedValue_1 == 'Set as inseminated')
              Text(
                'Bull/AI Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 10),
            if (selectedValue_1 == 'Set as inseminated')
              SizedBox(
                height: 60,
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 25),
            if (selectedValue_1 == 'Set as inseminated')
              Text(
                'AI Techinician Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 10),
            if (selectedValue_1 == 'Set as inseminated')
              SizedBox(
                height: 60,
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'in code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            SizedBox(height: 35),

            /*Text(
              "Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            DatePickerFormField(),*/
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/cow.jpg'),
                          // Load image from the database
                          fit: BoxFit.cover,
                          alignment: Alignment
                              .bottomCenter // Ensures the image covers the entire container
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
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
