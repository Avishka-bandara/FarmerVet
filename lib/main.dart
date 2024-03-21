import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmervet/vet_farm_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:farmervet/user_login.dart';
import 'farmer_animal.dart';
import 'firebase_auth_services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDwno0qdxzwfT5KRSqNSVnTswyNzwVGnqQ",
          appId: "1:93156038537:android:93c9059b01621461daf358",
          messagingSenderId: "93156038537",
          projectId: "farmervet-4e6b9",
          storageBucket: "farmervet-4e6b9.appspot.com"));
  await Firebase.initializeApp();

  runApp(FarmerVetApp());
}

class FarmerVetApp extends StatelessWidget {
  late Size screenSize;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<Widget> checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('user role').doc(user.uid).get();
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>? ?? {};
      String? role = userData['role'];

      if (role == 'vet') {
        return FarmViewScreen();
      } else if (role == 'farmer') {
        return Animal();
      }
    }
    // Default screen if role is not found or user is not logged in
    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: checkRole(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data ??
                  LoginScreen(); // Use LoginScreen as default
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
