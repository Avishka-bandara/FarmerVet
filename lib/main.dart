import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:farmervet/register.dart';

void main() {
  runApp(FarmerVetApp());
}

class FarmerVetApp extends StatefulWidget {
  @override
  State<FarmerVetApp> createState() => _FarmerVetAppState();
}

class _FarmerVetAppState extends State<FarmerVetApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FarmerVet',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight:Radius.circular(15) ),
                child: Image.asset(
                  'assets/cow.jpg', // Replace this with your image path
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Hi, Welcome to FarmerVet',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(28, 42, 58, 1)
                ),
              ),
              SizedBox(height: 40),
              Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 342,
                    child: TextField(
                      style: TextStyle(fontSize: 15),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Registered Phone Number',
                        prefixIcon: Icon(Icons.local_phone_outlined),
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SizedBox(
                    height: 45,
                    width: 342,
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
                SizedBox(height: 60),
                SizedBox(
                  height: 48,
                  width: 342,
                  child: ElevatedButton(
                    onPressed: () {
                      // Login button onPressed logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                      fixedSize:
                          const Size(300, 50), // Change the color as needed
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 85),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(28, 100, 242, 1),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?  ",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(28, 100, 242, 1),
                        ),
                      ),
                    ),
                  ],
                ),

              ]),
            ],
          ),
        ),
      ),
    );
  }
}
