import 'package:flutter/material.dart';

class totalMilkOutput extends StatefulWidget {
  @override
  _totalMilkOutputState createState() => _totalMilkOutputState();
}

class _totalMilkOutputState extends State<totalMilkOutput> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  late String _selectedDivision = '';

  @override
  void initState() {
    super.initState();
    // Initialize _selectedDate with a default value
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Farm Milk Output',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // Use Expanded to make the dropdown take remaining space
                        child: SizedBox(
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Year',
                              border: OutlineInputBorder(),
                            ),
                            items: <String>[
                              '2022',
                              '2023',
                              '2024',
                              '2025',
                              '2026',
                              '2027',
                            ] // Add your list of years here
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Handle dropdown value change
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                          width:
                              12), // Add space between dropdown and text field
                      Expanded(
                        // Use Expanded to make the text field take remaining space
                        child: SizedBox(
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Month',
                              border: OutlineInputBorder(),
                            ),
                            items: <String>[
                              'Jnauary',
                              'February',
                              'March',
                              'April',
                              'May',
                              'June',
                              'July',
                              'August',
                              'September',
                              'October',
                              'November',
                              'December'
                            ] // Add your list of years here
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Handle dropdown value change
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(75, 89, 99, 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total For This Month  :",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Total", // total milk quantity
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                DataTableExample(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  DataTableExample({Key? key}) : super(key: key);

  // Sample data to populate the DataTable
  final List<Map<String, dynamic>> _data = [
    {'date': '12/1/2024', 'quantity': 19, 'milkedCow': '10'},
    {'date': '14/1/2024', 'quantity': 43, 'milkedCow': '8'},
    {'date': '13/1/2024', 'quantity': 27, 'milkedCow': '9'},
    // Add more data here
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Quantity(liters)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Milked Cows',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ],
      rows: _data.map((Map<String, dynamic> item) {
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Text(item['date'].toString(), style: TextStyle(fontSize: 14)),
            ),
            DataCell(Text(item['quantity'].toString(),
                style: TextStyle(fontSize: 14))),
            DataCell(Text(item['milkedCow'].toString(),
                style: TextStyle(fontSize: 14))),
          ],
        );
      }).toList(),
    );
  }
}
