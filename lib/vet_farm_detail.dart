import 'package:farmervet/farm_milk_output.dart';
import 'package:farmervet/vet_add_new_reproduction.dart';
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
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),
            Text('Registration ID :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 20),
            Text('Address :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 20),
            Text('Divisional Secretary :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 20),
            Text('Gram Niladari Area :', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 20),
            Text('Phone Number:', style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => vet_animal()),
                        );
                      },
                      child: Container(
                        child: Image.asset('assets/view.png'),
                      ),
                    ),
                    Text("View Animals")
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => totalMilkOutput()),
                        );
                      },
                      child: Container(
                        child: Image.asset('assets/milk.png'),
                      ),
                    ),
                    Text("Milk Output")
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReproductionEntry()),
                        );
                      },
                      child: Container(
                        child: Image.asset('assets/breed.png'),
                      ),
                    ),
                    Text("Breeding")
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
