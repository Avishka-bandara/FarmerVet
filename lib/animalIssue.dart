class Issue {
  final String id;
  final String animalid;
  final String animalissue;
  final String animalage;
  final String animaltype;
  final String timeDate;
  final String animalname;


  Issue({
    required this.id,
    required this.animalid,
    required this.animalissue,
    required this.timeDate,
    required this.animaltype,
    required this.animalage,
    required this.animalname,


  });

  factory Issue.fromMap(Map<String, dynamic> map, String id) {
    return Issue(
      id: id,
      animalid: map['animal id'],
      animalissue: map['animalissue'],
      timeDate:map['timeDate'],
      animaltype:map['cowtype'],
      animalage:map['cowage'],
      animalname:map['cowname'],
    );
  }
}