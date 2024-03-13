import 'package:flutter/material.dart';
import 'package:farmervet/add_animal.dart';
import 'package:get/get.dart';

class UserRegistrationForm extends StatefulWidget {
  @override
  _UserRegistrationFormState createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  late String _selectedDivision = '';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
        Text("Register your farm with FarmerVet",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(28, 42, 58, 1)
          ),
          textAlign: TextAlign.justify,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    Text("Farm Name"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Farm name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            //   prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),

                    Text("Enter Farm Registration ID"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1), // Change this to the color you want
                            hintText: '*************',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            //  prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),

                    Text("Enter Farm Address"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Address',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            //  prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),

                    Text("Divisional Secretariat"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Divisional Secteriest',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            // prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),

                    Text("Grama Niladari Area"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Grama Niladari Area',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            //prefixIcon: Icon(Icons.lock_outline),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('Kandy'),
                              value: 'Option 1',
                            ),
                            DropdownMenuItem(
                              child: Text('Udunuwara'),
                              value: 'Option 2',
                            ),
                            DropdownMenuItem(
                              child: Text('Peradeniya'),
                              value: 'Option 3',
                            ),
                            // Add more DropdownMenuItem as needed
                          ],
                          onChanged: (String? value) {
                            Text(value.toString());
                          },
                        ),
                      ),
                    ),

                    Text("Enter Phone Number"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            // prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),

                    Text("Enter Password"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                        height: 45,
                        width: 342,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(209, 213, 219, 1),
                            hintText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            //prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
                SizedBox(
                  height: 48,
                  width: 342,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement registration logic here
                      Get.to(addAnimalForm());
                      String name = _nameController.text;
                      String id = _idController.text;
                      String address = _addressController.text;
                      String division = _selectedDivision;
                      print('Name: $name');
                      print('ID: $id');
                      print('Address: $address');
                      //print('Division: $division');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(28, 42, 58, 1),
                      fixedSize: const Size(300, 40),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

