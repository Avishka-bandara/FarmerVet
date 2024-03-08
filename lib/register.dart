import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/farmer_registration.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight:Radius.circular(15) ),
                  child: Image.asset(
                    'assets/cow.jpg', // Replace this with your image path
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 45),

                SizedBox(height: 15),
                Text(
                  'Choose user type ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      // Register as a farmer button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            // navigate to farmer registration form
                            Get.to(UserRegistrationForm());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Color.fromRGBO(28, 42, 58, 1),
                            fixedSize:
                                const Size(300, 50), // Change the color as needed
                          ),
                          child: const Text(
                            'Farmer View',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            // Registration button onPressed logic
                            Get.to(RegistrationConfirmationScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Color.fromRGBO(28, 42, 58, 1),
                            fixedSize:
                                const Size(300, 50), // Change the color as needed
                          ),
                          child: const Text(
                            'Vet/LDI View',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
