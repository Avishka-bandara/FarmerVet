import 'package:farmervet/farmList.dart';
import 'package:farmervet/farm_milk_output.dart';
import 'package:farmervet/vet_animal.dart';
import 'package:farmervet/vet_animalissue.dart';
import 'package:farmervet/vet_farm_breeding_info.dart';
import 'package:flutter/material.dart';

class FarmDetailView extends StatelessWidget {
  final List<Farm> farm;
  final int index;

  FarmDetailView(this.farm, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Farm Detail', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Farmer Name : ' + farm[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1),
            SizedBox(height: 10),
            Text('Registration ID : ' + farm[index].farmid,
                style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Address : ' + farm[index].address,
                style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text(
                'Divisional Secretary : ' +
                    farm[index].divisionalSecretariatArea,
                style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Gram Niladari Area : ' + farm[index].area,
                style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 10),
            Text('Email Address: ' + farm[index].email,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => vet_animal(farm: farm,index: index,)),
                        );
                      },
                      child: Container(
                        child: Image.asset('assets/view.png'),
                      ),
                    ),
                    Text("Animal View")
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => totalMilkOutput(id: farm[index].id)),
                        );
                      },
                      child: Container(
                        child: Image.asset('assets/milk.png'),
                      ),
                    ),
                    Text("Total Milk View")
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BreedingInfo()),
                        );
                      },
                      child: Container(
                        child: Image.asset('assets/breed.png'),
                      ),
                    ),
                    Text("Breeding View"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
