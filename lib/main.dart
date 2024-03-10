import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/register.dart';
import 'package:farmervet/user_login.dart';

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
      home: LoginScreen(),
    );
  }
}
