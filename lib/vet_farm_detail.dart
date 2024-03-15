import 'package:farmervet/vet_animal.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:flutter/material.dart';

class FarmDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Farmer Name: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1),
            SizedBox(height: 10),
            Text('Registration ID :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Address :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Divisional Secretary :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Gram Niladari Area :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Phone Number:', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => vet_animal()),
                    );
                  },
                  child: Container(
                    child: Image.asset('assets/view.png'),
                  ),
                ),
                Container(
                  child: Image.asset('assets/milk.png'),
                ),
                Container(
                  child: Image.asset('assets/breed.png'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
