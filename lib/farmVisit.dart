class FarmVisit {
  final String id;
  final String cowname;
  final String farmName;
  final String email;
  final String location;
  final String timedate;


  FarmVisit({
    required this.id,
    required this.cowname,
    required this.farmName,
    required this.email,
    required this.location,
    required this.timedate,

  });

  factory FarmVisit.fromMap(Map<String, dynamic> map, String id) {
    return FarmVisit(
      id: id,
      cowname: map['cowname'],
      farmName: map['farmName'],
      email:map['email'],
      location:map['location'],
      timedate:map['timeDate'],
    );
  }
}