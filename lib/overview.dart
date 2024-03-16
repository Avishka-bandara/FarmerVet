import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int activeFarms = 10; // Example value for active farms
    int inactiveFarms = 5; // Example value for inactive farms

    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Active Farms',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '$activeFarms',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        child:
                            VerticalDivider(thickness: 1, color: Colors.black),
                      ),
                      Column(
                        children: [
                          Text(
                            'Inactive Farms',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '$inactiveFarms',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ), // Showing the Deseased unproductive and lost/stolen animals
            Container(
              //height: 100.0,
              margin: EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Deseased',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '20', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(29, 36, 217, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '35', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(180, 187, 17, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '35', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(50, 119, 32, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                      SizedBox(
                        height: 100, // Adjust the height as needed
                        child:
                            VerticalDivider(thickness: 1, color: Colors.black),
                      ),
                      Column(
                        children: [
                          Text(
                            'Unproductive',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '5', // Example value for Unproductive animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(29, 36, 217, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '15', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(180, 187, 17, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '35', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(50, 119, 32, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100, // Adjust the height as needed
                        child:
                            VerticalDivider(thickness: 1, color: Colors.black),
                      ),
                      Column(
                        children: [
                          Text(
                            'Lost/stolen',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '15', // Example value for lost/stolen animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(29, 36, 217, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '2', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(180, 187, 17, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '35', // Example value for deseased animals
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(50, 119, 32, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40), // Adjust the height as needed
                      Text(
                        "Total Active Animals",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // Showing the total active animals
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('60',
                                style: TextStyle(
                                    color: Color.fromRGBO(29, 36, 217, 1),
                                    fontWeight: FontWeight.bold)),
                            Text('Cow',
                                style: TextStyle(
                                    color: Color.fromRGBO(29, 36, 217, 1),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          children: [
                            Text('60',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(180, 187, 17, 1),
                                    fontWeight: FontWeight.bold)),
                            Text('Calf',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(180, 187, 17, 1),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '35', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(50, 119, 32, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Heifer', // Example value for deseased animals
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(50, 119, 32, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ]),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OverviewScreen(),
  ));
}
