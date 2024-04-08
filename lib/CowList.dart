class Cow {
  // Cow class
  final String id;
  final String name;
  final String type;
  final String age;
  final String tag;
  final String breedType;

  Cow({
    //constructor
    required this.id,
    required this.name,
    required this.type,
    required this.age,
    required this.tag,
    required this.breedType,
  });

  factory Cow.fromMap(Map<String, dynamic> map, String id) {
    //factory method
    return Cow(
      id: id,
      name: map['animalname'],
      type: map['animaltype'],
      age: map['animalAge'],
      tag: map['tag'],
      breedType: map['breed'],
    );
  }
}
