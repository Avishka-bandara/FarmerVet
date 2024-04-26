import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/vet_farm_breeding_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_animalDetail.dart';
import 'package:farmervet/daily_milk_entry.dart';
import 'package:farmervet/farm_milk_output.dart';

import 'CowList.dart';
import 'farmList.dart';

typedef void UpdateVariableCallback(DateTime? selectedDate);

class ReproductionEntry extends StatefulWidget {
  final List<Cow> cows;
  final int index;
  final List<Farm> farm;
  final int index2;

  ReproductionEntry(this.cows, this.index, this.farm, this.index2);

  @override
  _ReproductionEntryState createState() => _ReproductionEntryState();
}

class _ReproductionEntryState extends State<ReproductionEntry> {
  String? selectedValue_1;
  DateTime? selectedDate;
  String? selectedValue;
  late int selectedRadio;
  TextEditingController cowaicode = TextEditingController();
  TextEditingController aiTechCode = TextEditingController();
  TextEditingController calfName = TextEditingController();
  String? calfGender;
  bool isLoading = false;

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
            CustomCardWidget(widget.cows, widget.index),
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
              items: ['1st Service', '2nd Service', '3rd Service'],
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
            if (selectedValue_1 == 'Gave birth')
              DatePickerFormField(onUpdate: (newValue) {
                setState(() {
                  selectedDate = newValue;
                });
              }),
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
                  //obscureText: false,
                  controller: calfName,
                  decoration: InputDecoration(
                    hintText: 'code',
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
                  hintText: 'choose',
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
                  setState(() {
                    calfGender = newValue;
                  });
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

            if (selectedValue_1 == 'Set as pregnant')
              DatePickerFormField(onUpdate: (newValue) {
                setState(() {
                  selectedDate = newValue;
                });
              }),
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

            if (selectedValue_1 == 'Pregnancy failed')
              DatePickerFormField(onUpdate: (newValue) {
                setState(() {
                  selectedDate = newValue;
                });
              }),
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

            if (selectedValue_1 == 'Set as inseminated')
              DatePickerFormField(onUpdate: (newValue) {
                setState(() {
                  selectedDate = newValue;
                });
              }),
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
                  Text("Cow"),
                ],
              ),
            SizedBox(height: 20),
            if (selectedValue_1 == 'Set as inseminated')
              Text(
                'Cow/AI Code',
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
                  controller: cowaicode,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Code',
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
                  controller: aiTechCode,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'in code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            SizedBox(height: 35),
            SizedBox(
              height: 48,
              width: 342,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                  fixedSize: const Size(300, 50), // Change the color as needed
                ),
                onPressed: () {
                  if (selectedValue_1 == 'Set as inseminated') {
                    String date = selectedDate!.day.toString() +
                        '/' +
                        selectedDate!.month.toString() +
                        '/' +
                        selectedDate!.year.toString();
                    String method = "";
                    if (selectedRadio == 1) {
                      method = "AI";
                    } else if (selectedRadio == 2) {
                      method = "Cow";
                    }
                    String cowAicode = cowaicode.text.trim();
                    String aiTechcode = aiTechCode.text.trim();

                    setInseminated(date, method, cowAicode, aiTechcode);
                  } else if (selectedValue_1 == 'Set as pregnant') {
                    String date = selectedDate!.day.toString() +
                        '/' +
                        selectedDate!.month.toString() +
                        '/' +
                        selectedDate!.year.toString();

                    setpregnant(date);
                  } else if (selectedValue_1 == 'Gave birth') {
                    String date = selectedDate!.day.toString() +
                        '/' +
                        selectedDate!.month.toString() +
                        '/' +
                        selectedDate!.year.toString();
                    gavebirth(date, calfName.text.trim(), calfGender!);
                  } else if (selectedValue_1 == 'Pregnancy failed') {
                    String date = selectedDate!.day.toString() +
                        '/' +
                        selectedDate!.month.toString() +
                        '/' +
                        selectedDate!.year.toString();

                    pregnancyFailde(date);
                  }
                },
                child: isLoading //..........Loading Indicator........
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
          ]),
        ),
      ),
    );
  }

  Future<void> setInseminated(
      String date, String method, String cowAicode, String aiTechCode) async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection('Farm details/' +
              widget.farm[widget.index2].id +
              '/animal details/' +
              widget.cows[widget.index].id +
              '/breeding details') //..........Firebase Collection........
          .doc(selectedValue) //..........Firebase Document........
          .update({
        //..........Firebase Data........
        'stage': selectedValue_1,
        'inseminateddate': date,
        'method': method,
        'cowAicode': cowAicode,
        'aiTechCode': aiTechCode,
      }).then((value) {
        setState(() {
          isLoading = false;
        });
        showToast("Added Successfully");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BreedingInfo(widget.farm,
                    widget.index2))); //..........Navigate to the page........
      }).catchError((error) async {
        await FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/animal details/' +
                widget.cows[widget.index].id +
                '/breeding details') //..........Firebase Collection........
            .doc(selectedValue) //..........Firebase Document........
            .set({
          //..........Firebase Data........
          'stage': selectedValue_1,
          'inseminateddate': date,
          'method': method,
          'cowAicode': cowAicode,
          'aiTechCode': aiTechCode,
        }).then((value) {
          setState(() {
            isLoading = false;
          });
          showToast("Added Successfully");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BreedingInfo(widget.farm,
                      widget.index2))); //..........Navigate to the page........
        }).catchError((error) {
          //..........Error Handling........
          setState(() {
            isLoading = false;
          });
          print("Failed to store data: $error");
        });
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error.toString());
    }
  }

  Future<void> setpregnant(String date) async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection('Farm details/' +
              widget.farm[widget.index2].id +
              '/animal details/' +
              widget.cows[widget.index].id +
              '/breeding details') //..........Firebase Collection........
          .doc(selectedValue) //..........Firebase Document........
          .update({
        //..........Firebase Data........
        'pregnantdate': date,
        'stage': selectedValue_1,
      }).then((value) {
        setState(() {
          isLoading = false;
        });
        showToast("Added Successfully");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BreedingInfo(widget.farm,
                    widget.index2))); //..........Navigate to the page........
      }).catchError((error) async {
        await FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/animal details/' +
                widget.cows[widget.index].id +
                '/breeding details') //..........Firebase Collection........
            .doc(selectedValue) //..........Firebase Document........
            .set({
          //..........Firebase Data........
          'pregnantdate': date,
          'stage': selectedValue_1,
        }).then((value) {
          setState(() {
            isLoading = false;
          });
          showToast("Added Successfully");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BreedingInfo(widget.farm,
                      widget.index2))); //..........Navigate to the page........
        }).catchError((error) {
          //..........Error Handling........
          setState(() {
            isLoading = false;
          });
          print("Failed to store data: $error");
        });
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error.toString());
    }
  }

  Future<void> pregnancyFailde(String date) async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection('Farm details/' +
              widget.farm[widget.index2].id +
              '/animal details/' +
              widget.cows[widget.index].id +
              '/breeding details') //..........Firebase Collection........
          .doc(selectedValue) //..........Firebase Document........
          .update({
        //..........Firebase Data........
        'Pregnancyfaileddate': date,
        'stage': selectedValue_1,
      }).then((value) {
        setState(() {
          isLoading = false;
        });
        showToast("Added Successfully");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BreedingInfo(widget.farm,
                    widget.index2))); //..........Navigate to the page........
      }).catchError((error) async {
        await FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/animal details/' +
                widget.cows[widget.index].id +
                '/breeding details') //..........Firebase Collection........
            .doc(selectedValue) //..........Firebase Document........
            .set({
          //..........Firebase Data........
          'Pregnancyfaileddate': date,
          'stage': selectedValue_1,
        }).then((value) {
          setState(() {
            isLoading = false;
          });
          showToast("Added Successfully");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BreedingInfo(widget.farm,
                      widget.index2))); //..........Navigate to the page........
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
        });
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error.toString());
      showToast(error.hashCode.toString());
    }
  }

  Future<void> gavebirth(String date, String name, String gender) async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection('Farm details/' +
              widget.farm[widget.index2].id +
              '/animal details/' +
              widget.cows[widget.index].id +
              '/breeding details') //..........Firebase Collection........
          .doc(selectedValue) //..........Firebase Document........
          .update({
        //..........Firebase Data........
        'Birthdate': date,
        'name': name,
        'gender': gender,
        'stage': selectedValue_1,
      }).then((value) {
        setState(() {
          isLoading = false;
        });
        showToast("Added Successfully");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BreedingInfo(widget.farm,
                    widget.index2))); //..........Navigate to the page........
      }).catchError((error) async {
        await FirebaseFirestore.instance
            .collection('Farm details/' +
                widget.farm[widget.index2].id +
                '/animal details/' +
                widget.cows[widget.index].id +
                '/breeding details') //..........Firebase Collection........
            .doc(selectedValue) //..........Firebase Document........
            .set({
          //..........Firebase Data........
          'Birthdate': date,
          'name': name,
          'gender': gender,
          'stage': selectedValue_1,
        }).then((value) {
          setState(() {
            isLoading = false;
          });
          showToast("Added Successfully");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BreedingInfo(widget.farm,
                      widget.index2))); //..........Navigate to the page........
        }).catchError((error) {
          //..........Error Handling........
          setState(() {
            isLoading = false;
          });
          print("Failed to store data: $error");
        });
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      showToast(error.hashCode.toString());
    }
  }

  void showToast(String message) {
    //..........Toast Message........
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

// custom card widget
//
class CustomCardWidget extends StatelessWidget {
  final List<Cow> cows;
  final int index;

  CustomCardWidget(this.cows, this.index);

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
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage(getImageAsset(cows[index].type)),
                          // Load image from the database
                          fit: BoxFit.fill,
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
                      Text("Tag Number: " + cows[index].tag,
                          textAlign: TextAlign.right),
                      Text("Age: " + cows[index].age,
                          textAlign: TextAlign.right),
                      Text("Breed Type: " + cows[index].breedType,
                          textAlign: TextAlign.right),
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

  String getImageAsset(String name) {
    switch (name) {
      case "Cow":
        return 'assets/Cow.jpeg';
      case "Heifer":
        return 'assets/heifer.jpg';
      case "Calf-Male":
        return 'assets/mcalf.jpg';
      case "Bull":
        return 'assets/bull.jpg';
      default:
        return 'assets/fcalf.jpg';
    }
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
  final UpdateVariableCallback onUpdate;

  DatePickerFormField({required this.onUpdate});

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
        widget.onUpdate(_selectedDate);
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

  void showToast(String message) {
    //..........Toast Message........
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
