import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:farmervet/vet_farm_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'firebase_auth_services.dart';

class RegisterVetForm extends StatefulWidget {
  @override
  _RegisterVetFormState createState() => _RegisterVetFormState();
}

class _RegisterVetFormState extends State<RegisterVetForm> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Your Account'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter Your Username"),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("Enter Email Address"),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Example@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("Enter Password"),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    checkSignup();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                    fixedSize: const Size(300, 50),
                  ),
                  child: isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Creating an account....  ',
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
                          'Create a account',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }

  void signup(String email, String password, String username) async {
    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        setState(() {
          isLoading = false;
        });

        await FirebaseFirestore.instance
            .collection('vet details')
            .doc(user.uid)
            .set({
          'User Id': user.uid,
          'Vet Email': email,
          'User Name': username,
          // Add more fields as needed
        });

        await FirebaseFirestore.instance
            .collection('user role')
            .doc(user.uid)
            .set({
          'role': 'vet',
          // Add more fields as needed
        });
        showToast("Account Created Successfully");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FarmViewScreen()));
      } else {
        setState(() {
          isLoading = false;
        });
        showToast("This account is already exists");
      }
    } catch (e) {
      print(e.toString());
      showToast(e.toString());
    }
  }

  void checkSignup() {
    String username = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (!password.isEmpty && !username.isEmpty && !email.isEmpty) {
      if (password.length >= 6) {
        setState(() {
          isLoading = true;
        });
        signup(email, password, username);
      } else {
        showToast("Password must be include at least 6 characters");
      }
    } else {
      showToast("All the fields must be filled");
    }
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
