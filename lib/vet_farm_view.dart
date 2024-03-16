import 'package:farmervet/user_login.dart';
import 'package:farmervet/vet_animal.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:farmervet/vet_farm_detail.dart';
import 'package:farmervet/vet_required_farm_visit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FarmViewScreen(),
  ));
}

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
                  hintText: 'Search farms',
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
                    title: Text('Overview',
                        style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                    onTap: () {
                      // navigate to the overview screen bar chart
                    },
                  ),
                  ListTile(
                    title: Text(
                      'View Farms',
                      style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmViewScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Reported Health Issue',
                        style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => vet_animal()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Requard Farm Visit',
                        style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Required_visits()),
                      );
                    },
                  ),
                ],
              ),
            ),
            // This ListTile is now at the bottom of the Drawer
            ListTile(
              title: Text('Logout',
                  style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
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

  void signout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Signed Out',
              style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
          content: Text('Do you need to sign out.',
              style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen())); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}

class FarmCard extends StatefulWidget {
  final String farmName;
  final String farmLocation;
  final String farmDistance;

  const FarmCard({
    required this.farmName,
    required this.farmLocation,
    required this.farmDistance,
  });

  @override
  _FarmCardState createState() => _FarmCardState();
}

class _FarmCardState extends State<FarmCard> {
  bool isActive = false; // Initialize the checkbox state

  // Function to update the database
  void updateDatabase(bool newValue) {
    // Simulate updating the database with the new status
    print('Updating database with status: ${newValue ? "Inactive" : "Active"}');
    // Add your database update logic here
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FarmDetailView()),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.farmName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          isActive ? Colors.red : Color.fromRGBO(28, 42, 58, 1),
                    ),
                  ),
                  Checkbox(
                    value: isActive,
                    onChanged: (newValue) {
                      // Update the checkbox state
                      setState(() {
                        isActive = newValue!;
                        // Call function to update the database
                        updateDatabase(newValue!);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(28, 42, 58, 1),
                    size: 20.0,
                  ),
                  Text(
                    widget.farmLocation,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromRGBO(28, 42, 58, 1),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1.0),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    widget.farmDistance,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(28, 42, 58, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
