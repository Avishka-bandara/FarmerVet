import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/vet_farm_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:farmervet/register.dart';
import 'package:farmervet/farmer_animal.dart';

import 'firebase_auth_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuthService _auth=FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  late Size screenSize;
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    // Initialize controller values for testing
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(209, 213, 219, 1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Registered Email Address',
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
                      controller: _password,
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
                      checksignin();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(28, 42, 58, 1),
                      fixedSize:
                          const Size(300, 50), // Change the color as needed
                    ),
                    child: isLoading? const Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login....  ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            height:30,
                            width: 30,
                            child: CircularProgressIndicator(color: Colors.white,)),
                      ],
                    ): const Text(
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
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> RegisterScreen()));
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

  void checksignin(){
    String email=_emailController.text;
    String password= _password.text;

    try{
      if(email!="" && password!=""){
        setState(() {
          isLoading=true;
        });
        try{
          signin(email, password);
        }catch(e){
          showToast(e.toString());
        }
      }
      else{
        setState(() {
          isLoading=false;
        });
        showToast("Please enter correct email & password");
      }
    }catch(e){
      showToast(e.toString());
    }

  }

  void signin (String email,String password)async{

    User? user=await _auth.signInWithEmailAndPassword(email, password);

    DocumentSnapshot userSnapshot = await _firestore.collection('user role').doc(user!.uid).get();
    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>? ?? {};
    String? role = userData['role'];

    if(role == 'vet'){
      if(user!=null){
        setState(() {
          isLoading=false;
        });
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> FarmViewScreen()));
      }
      else{
        setState(() {
          isLoading=false;
        });

        showToast("Login Failed!");
      }
    }
    else if(role == 'farmer'){
      if(user!=null){
        setState(() {
          isLoading=false;
        });
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> Animal()));
      }
      else{
        setState(() {
          isLoading=false;
        });

        showToast("Login Failed!");
      }
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
