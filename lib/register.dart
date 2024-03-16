import 'package:farmervet/user_login.dart';
import 'package:farmervet/vet_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_registration.dart';

class RegisterScreen extends StatelessWidget {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        return true;
      },
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: Wrap(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      child: SizedBox(
                        width: screenSize.width,
                        height: 341,
                        child: Image.asset(
                          'assets/cow.jpg', // Replace this with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Hi, Welcome to FarmerVet!',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(28, 42, 58, 1)),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Choose your view ',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(28, 42, 58, 1)),
                    ),
                    SizedBox(height: 70),
                    Column(
                      children: <Widget>[
                        // Register as a farmer button
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SizedBox(
                            width: 328,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserRegistrationForm()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                                fixedSize: const Size(
                                    300, 50), // Change the color as needed
                              ),
                              child: const Text(
                                'Farmer View',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SizedBox(
                            width: 328,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterVetForm()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                                fixedSize: const Size(
                                    300, 50), // Change the color as needed
                              ),
                              child: const Text(
                                'Vet/LDI View',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Confirmation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have successfully registered!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Navigate back to login screen
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
