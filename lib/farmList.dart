class Farm {
  final String id;
  final String name;
  final String area;
  final String email;
  final String divisionalSecretariatArea;
  final String address;
  final String farmid;
  final String status;


  Farm({
    required this.id,
    required this.name,
    required this.area,
    required this.email,
    required this.divisionalSecretariatArea,
    required this.address,
    required this.farmid,
    required this.status

  });

  factory Farm.fromMap(Map<String, dynamic> map, String id) {
    return Farm(
      id: id,
      name: map['Farm Name'],
      area: map['Grama niladari area'],
      email:map['Farmer Email'],
      divisionalSecretariatArea:map['Divisional secretariat area'],
      address:map['Farm Address'],
      farmid:map['Farm Id'],
      status: map['status'],
    );
  }
}