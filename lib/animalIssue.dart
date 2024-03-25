class Issue {
  //class to store the animal issue details
  final String id;
  final String animalid;
  final String animalissue;
  final String animalage;
  final String animaltype;
  final String timeDate;
  final String animalname;
  final String imageUrl;
  final bool visit;

  Issue(
      { //constructor
      required this.id,
      required this.animalid,
      required this.animalissue,
      required this.timeDate,
      required this.animaltype,
      required this.animalage,
      required this.animalname,
      required this.imageUrl,
      required this.visit});

  factory Issue.fromMap(Map<String, dynamic> map, String id) {
    return Issue(
      //returning the values
      id: id,
      animalid: map['animal id'],
      animalissue: map['animalissue'],
      timeDate: map['timeDate'],
      animaltype: map['cowtype'],
      animalage: map['cowage'],
      animalname: map['cowname'],
      imageUrl: map['imageurl'],
      visit: map['visit'],
    );
  }
}
