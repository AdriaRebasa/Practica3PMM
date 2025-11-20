import 'models.dart';

class Character {
  int id;
  int? age;
  DateTime? birthdate;
  String gender;
  String name;
  String occupation;
  String? portraitPath;
  List<String>? phrases;
  String status;

  Character({
    required this.id,
    this.age,
    this.birthdate,
    required this.gender,
    required this.name,
    required this.occupation,
    this.portraitPath,
    this.phrases,
    required this.status,
  });

  get fullPortraitPath {
    if (portraitPath != null) {
      return 'https://cdn.thesimpsonsapi.com/500$portraitPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        age: json["age"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        gender: json["gender"],
        name: json["name"],
        occupation: json["occupation"],
        portraitPath: json["portrait_path"],
        phrases: json["phrases"] == null
            ? []
            : List<String>.from(json["phrases"].map((x) => x)),
        status: json["status"],
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "age": age,
  //     "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
  //     "gender": genderValues.reverse[gender],
  //     "name": name,
  //     "occupation": occupation,
  //     "portrait_path": portraitPath,
  //     "phrases": List<dynamic>.from(phrases.map((x) => x)),
  //     "status": statusValues.reverse[status],
  // };
}
