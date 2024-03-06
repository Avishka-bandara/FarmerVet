import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farmervet/register.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Animal(),
    );
  }
}

class Animal extends StatefulWidget {
  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(children: [
            ListTile(
              title: Text('Add Milk Data',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text('Add the milk data of your farm here'),
            ),
            Row(children: [
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  //Get.to(AddMilkData());
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0),
                  // Change the color as needed
                  fixedSize: const Size(160, 45),
                ),
                child: Text(
                  'Add Milk Data',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  //Get.to(AddMilkData());
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0),
                  // Change the color as needed
                  fixedSize: const Size(160, 45),
                ),
                child: Text(
                  'Add Milk Data',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Divider(thickness: 1),
            SizedBox(height: 10),
            CustomSearchBar(),
          ]),
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
                    title: Text('Add new animal '),
                    onTap: () {
                      // navigate to the AddAnimalwidget
                    },
                  ),
                  ListTile(
                    title: Text('Farm milk output'),
                    onTap: () {
                      //navigate to the farmer
                    },
                  ),
                  ListTile(
                    title: Text('Account'),
                    onTap: () {
                      Get.to(() => Animal());
                    },
                  ),
                ],
              ),
            ),
            // This ListTile is now at the bottom of the Drawer
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                //Loging from the account;
              },
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}

// search bar widget

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String searchText = '';
  List<String> selectedKeywords = [];
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchText = value;
        });
      },
      onSubmitted: (value) {
        searchDatabase(value); // Call function to search the database
      },
      decoration: InputDecoration(
        hintText: "Search for an animal",
        suffixIcon: PopupMenuButton(
          icon: Icon(Icons.tune),
          itemBuilder: (BuildContext context) {
            return [
              //cow, calf - male, calf female, bull, heifer
              PopupMenuItem(
                child: Text('cow'),
                value: 'cow',
              ),
              PopupMenuItem(
                child: Text('calf-male'),
                value: 'calf-male',
              ),
              PopupMenuItem(
                child: Text('calf female'),
                value: 'calf female',
              ),
              PopupMenuItem(
                child: Text('bull'),
                value: 'bull',
              ),
              PopupMenuItem(
                child: Text('heifer'),
                value: 'heifer',
              ),
            ];
          },
          onSelected: (String value) {
            // Handle selection of keywords
            setState(() {
              searchText = value;
            });
            searchDatabase(value);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }

  void searchDatabase(String keyword) {
    // Perform database query with the selected keywords
    print('Searching database for: $keyword');
  }
}

class ShowAnimal extends StatefulWidget {
  @override
  _ShowAnimalState createState() => _ShowAnimalState();
}

class _ShowAnimalState extends State<ShowAnimal> {
  @override
  Widget build(BuildContext context) {
    String imagePath;
    String animalName;
    String type;
    String health;
    String age;

    final image = Container(
      // image conatiner
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2,
                // load the image from the imagePath
                /*child: Image.asset(
                         imagePath,
                        fit: BoxFit.cover,
                      ),*/
              ),
            ],
          ),
        ),
      ),
    );
    final detail = Column(
      children: [
        // Get the AnimalName from the database
        //Text(animalName, style: TextStyle(fontSize:18 , fontWeight: FontWeight.bold)),
        Divider(thickness: 1),
        Row(children: [
          // Get the Type from the database
          //Text(type, style: TextStyle(fontSize:18 , fontWeight: FontWeight.bold)),
        ])
      ],
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(.0),
        child: Row(
          children: [
            image,
            // add the image container here
            Column(
              children: [
                // Name of the animal
                //Divider(thickness: 1),
                // type
                // health
                // age
              ],
            ),
          ],
        ),
      ),
    );
  }
}
