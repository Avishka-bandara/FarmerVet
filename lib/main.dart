import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/user_login.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
