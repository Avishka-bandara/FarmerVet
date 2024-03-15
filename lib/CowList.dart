class Cow {
  final String id;
  final String name;
  final String type;
  final String age;
  final String tag;

  Cow({
    required this.id,
    required this.name,
    required this.type,
    required this.age,
    required this.tag,

  });

  factory Cow.fromMap(Map<String, dynamic> map, String id) {
    return Cow(
        id: id,
        name: map['animalname'],
        type: map['animaltype'],
        age:map['animalAge'],
      tag:map['tag'],
    );
  }
}