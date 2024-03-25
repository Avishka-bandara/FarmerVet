import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/farmer_animal.dart';
import 'package:farmervet/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase_auth_services.dart';

class UserRegistrationForm extends StatefulWidget {
  @override
  _UserRegistrationFormState createState() => _UserRegistrationFormState(); 
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {  
  final FirebaseAuthService _auth = FirebaseAuthService();  
  TextEditingController _farmnameController = TextEditingController();
  TextEditingController _farmidController = TextEditingController();
  TextEditingController _farmaddressController = TextEditingController();
  TextEditingController _DivisionalSecretariatController =
      TextEditingController();
  TextEditingController _gramaniladhariAreacontroller = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {  
    final Size screenSize = MediaQuery.of(context).size;  
    return WillPopScope(  
      onWillPop: () async { 
        Navigator.pushReplacement(  
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));  
        return true;
      },
      child: Scaffold(  
        appBar: AppBar(
          centerTitle: true,  
          title: Text(
            "Register your farm with FarmerVet",  
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 42, 58, 1)),  
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
                            controller: _farmnameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              hintText: 'Farm name',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                            controller: _farmidController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              // Change this to the color you want

                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                            controller: _farmaddressController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              hintText: 'Address',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              //  prefixIcon: Icon(Icons.lock_outline),
                            ),
                          ),
                        ),
                      ),
                      Text("Divisional Secretariat Area"),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                        child: SizedBox(
                          height: 45,
                          width: 342,
                          child: TextField(
                            controller: _DivisionalSecretariatController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              hintText: 'Divisional Secteriest Area',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                          child: TextField(
                            controller: _gramaniladhariAreacontroller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              hintText: 'Grama Niladari Area',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              // prefixIcon: Icon(Icons.lock_outline),
                            ),
                          ),
                        ),
                      ),
                      Text("Enter Email Address"),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                        child: SizedBox(
                          height: 45,
                          width: 342,
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(209, 213, 219, 1),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                        checkSignup();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(28, 42, 58, 1),
                        fixedSize: const Size(300, 40),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup(String email, String password, String farmname, String farmid,
      String farmaddress, String divisionalsec, String gramanila) async {
    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        setState(() {
          isLoading = false;
        });

        await FirebaseFirestore.instance
            .collection('Farm details')
            .doc(user.uid)
            .set({
          'User Id': user.uid,
          'Farmer Email': email,
          'Farm Name': farmname,
          'Farm Id': farmid,
          'Farm Address': farmaddress,
          'Divisional secretariat area': divisionalsec,
          'Grama niladari area': gramanila,
          'status':"active"
          // Add more fields as needed
        });

        await FirebaseFirestore.instance
            .collection('user role')
            .doc(user.uid)
            .set({
          'role': 'farmer',
          // Add more fields as needed
        });
        showToast("Account Created Successfully");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Animal()));
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
    String farmname = _farmnameController.text;
    String farmid = _farmidController.text;
    String farmaddress = _farmaddressController.text;
    String divisionalsec = _DivisionalSecretariatController.text;
    String gramanila = _gramaniladhariAreacontroller.text;
    String email = _emailController.text;
    String password = _password.text;

    if (!password.isEmpty &&
        !farmname.isEmpty &&
        !farmid.isEmpty &&
        !farmaddress.isEmpty &&
        !divisionalsec.isEmpty &&
        !gramanila.isEmpty &&
        !email.isEmpty) {
      if (password.length >= 6) {
        setState(() {
          isLoading = true;
        });
        signup(email, password, farmname, farmid, farmaddress, divisionalsec,
            gramanila);
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
