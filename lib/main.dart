import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/user_login.dart';

import 'farmer_animal.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyDwno0qdxzwfT5KRSqNSVnTswyNzwVGnqQ", appId: "1:93156038537:android:93c9059b01621461daf358", messagingSenderId: "93156038537", projectId: "farmervet-4e6b9"));
  await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;
  runApp(FarmerVetApp(user: user));
}

class FarmerVetApp extends StatelessWidget {
  final User? user;

  FarmerVetApp({this.user});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? Animal() : LoginScreen(),
    );
  }
}
