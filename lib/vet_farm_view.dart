import 'package:farmervet/user_login.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:farmervet/vet_farm_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FarmViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm View'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  //fillColor: Color.fromRGBO(209, 213, 219, 1),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.search_outlined),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            FarmCard(
              farmName: 'Farm A',
              farmLocation: 'Location A',
              farmDistance: '5 km',
            ),
            SizedBox(height: 16.0),
            FarmCard(
              farmName: 'Farm B',
              farmLocation: 'Location B',
              farmDistance: '25 km',
            ),
            SizedBox(height: 16.0),
            FarmCard(
              farmName: 'Farm C',
              farmLocation: 'Location C',
              farmDistance: '15 km',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  ListTile(
                    title: Text('Overview'),
                    onTap: () {
                      // navigate to the overview screen bar chart
                    },
                  ),
                  ListTile(
                    title: Text('View Farms'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmViewScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Reported Health Issue'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => vetAnimalIssue()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Requard Farm Visit'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            // This ListTile is now at the bottom of the Drawer
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                signout(context);
              },
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  void signout (BuildContext context)async{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Signed Out'),
          content: Text('Do you need to sign out.'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginScreen())); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

}

class FarmCard extends StatelessWidget {
  final String farmName;
  final String farmLocation;
  final String farmDistance;

  const FarmCard({
    required this.farmName,
    required this.farmLocation,
    required this.farmDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => FarmDetailView())),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    farmName,
                    // Replace with the farm name from the database
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    Icon(Icons
                        .location_on_outlined), // Add your desired prefix icon here
                    SizedBox(width: 5),
                    Text(
                      farmLocation,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ]),
                  Divider(thickness: 1.0),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      /*Icon(Icons
                        .location_on_outlined), // Add your desired prefix icon here
                    SizedBox(
                        width:
                            5), */ // Adjust spacing between icon and text as needed
                      Text(
                        farmDistance,
                        // Replace with the farm name from the database
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
