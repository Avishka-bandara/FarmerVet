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
   late String _selectedDivision='';


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('User Registration'),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'ID',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Divisional Secteriest',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Grama Niladari Area',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
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
                        // Handle dropdown value change
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
          

                SizedBox(height: 20),
                ElevatedButton(
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
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserRegistrationForm(),
  ));
}
