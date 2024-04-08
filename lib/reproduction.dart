class Reproduction {
  // Cow class
  final String id;
  final String inserminatedDate;
  final String pregnatDate;
  final String BirthDate;

  Reproduction({
    //constructor
    required this.id,
    required this.inserminatedDate,
    required this.pregnatDate,
    required this.BirthDate,
  });

  factory Reproduction.fromMap(Map<String, dynamic> map, String id) {
    //factory method
    return Reproduction(
      id: id,
      inserminatedDate: map['inseminateddate'],
      pregnatDate: map['pregnantdate'],
      BirthDate: map['Birthdate'],
    );
  }
}
