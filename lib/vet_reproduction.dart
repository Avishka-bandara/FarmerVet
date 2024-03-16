import 'package:flutter/material.dart';



class vet_reproduction extends StatelessWidget {
  const vet_reproduction({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Reproduction',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 42, 58, 1))),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),

          ExpansionTile(
            title: Text('Session 1',
                style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),

            // The content that expands or collapses
            children: <Widget>[
              ListTile(
                title: Text('Inserminated Date',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 1 tap
                },
              ),
              ListTile(
                title: Text('Pregnant Diagnosis',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 1 tap
                },
              ),
              ListTile(
                title: Text('Birth Date',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 2 tap
                },
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          ExpansionTile(
            title: Text('Session 2',
                style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),

            // The content that expands or collapses
            children: <Widget>[
              ListTile(
                title: Text('Inserminated Date',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 1 tap
                },
              ),
              ListTile(
                title: Text('Pregnant Diagnosis',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 1 tap
                },
              ),
              ListTile(
                title: Text('Birth Date',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 2 tap
                },
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          ExpansionTile(
            title: Text('Session 3',
                style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),

            // The content that expands or collapses
            children: <Widget>[
              ListTile(
                title: Text('Inserminated Date',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
              ),
              ListTile(
                title: Text('Pregnant Diagnosis',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 1 tap
                },
              ),
              ListTile(
                title: Text('Birth Date',
                    style: TextStyle(color: Color.fromRGBO(28, 42, 58, 1))),
                onTap: () {
                  // Handle subitem 2 tap
                },
              ),
            ],
          ),
          // Add more ExpansionTile widgets as needed
        ],
      ),
    );
  }
}
