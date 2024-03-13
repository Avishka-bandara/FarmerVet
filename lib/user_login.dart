import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/register.dart';
import 'package:farmervet/farmer_animal.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Size screenSize;

  @override
  void initState() {
    super.initState();
    // Initialize controller values for testing
    mobileController.text = "077"; // Replace with your mobile number
    passwordController.text = "p123"; // Replace with your password
  }

  Widget build(BuildContext context) {
     screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
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

              Column(children: <Widget>[
                Text(
                  'Hi, Welcome to FarmerVet!',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(28, 42, 58, 1)
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    width: 342,
                    height: 45,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(209, 213, 219, 1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Registered Phone Number',
                        prefixIcon: Icon(Icons.local_phone_outlined),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    width: 342,
                    height: 45,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(209, 213, 219, 1),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                SizedBox(
                  width: 342,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(Home());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(28, 42, 58, 1),
                      fixedSize:
                          const Size(300, 50), // Change the color as needed
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(28, 100, 242, 1),
                  ),
                ),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),

                    SizedBox(
                      width: 5,
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.to(
                            RegisterScreen()
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
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
