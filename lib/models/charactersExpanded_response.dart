import 'models.dart';

class GetCharactersExpanded {
  int id;
  int age;
  DateTime birthdate;
  String description;
  int firstAppearanceEpId;
  int firstAppearanceShId;
  String gender;
  String name;
  String occupation;
  List<String> phrases;
  String portraitPath;
  String status;
  FirstAppearance firstAppearanceEp;
  FirstAppearance firstAppearanceSh;

  GetCharactersExpanded({
    required this.id,
    required this.age,
    required this.birthdate,
    required this.description,
    required this.firstAppearanceEpId,
    required this.firstAppearanceShId,
    required this.gender,
    required this.name,
    required this.occupation,
    required this.phrases,
    required this.portraitPath,
    required this.status,
    required this.firstAppearanceEp,
    required this.firstAppearanceSh,
  });

  factory GetCharactersExpanded.fromRawJson(String str) =>
      GetCharactersExpanded.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory GetCharactersExpanded.fromJson(Map<String, dynamic> json) =>
      GetCharactersExpanded(
        id: json["id"],
        age: json["age"],
        birthdate: DateTime.parse(json["birthdate"]),
        description: json["description"],
        firstAppearanceEpId: json["first_appearance_ep_id"],
        firstAppearanceShId: json["first_appearance_sh_id"],
        gender: json["gender"],
        name: json["name"],
        occupation: json["occupation"],
        phrases: List<String>.from(json["phrases"].map((x) => x)),
        portraitPath: json["portrait_path"],
        status: json["status"],
        firstAppearanceEp:
            FirstAppearance.fromJson(json["first_appearance_ep"]),
        firstAppearanceSh:
            FirstAppearance.fromJson(json["first_appearance_sh"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "age": age,
  //       "birthdate":
  //           "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
  //       "description": description,
  //       "first_appearance_ep_id": firstAppearanceEpId,
  //       "first_appearance_sh_id": firstAppearanceShId,
  //       "gender": gender,
  //       "name": name,
  //       "occupation": occupation,
  //       "phrases": List<dynamic>.from(phrases.map((x) => x)),
  //       "portrait_path": portraitPath,
  //       "status": status,
  //       "first_appearance_ep": firstAppearanceEp.toJson(),
  //       "first_appearance_sh": firstAppearanceSh.toJson(),
  //     };
}

class FirstAppearance {
  int id;
  DateTime airdate;
  String description;
  int episodeNumber;
  String imagePath;
  String name;
  int season;
  String synopsis;

  FirstAppearance({
    required this.id,
    required this.airdate,
    required this.description,
    required this.episodeNumber,
    required this.imagePath,
    required this.name,
    required this.season,
    required this.synopsis,
  });

  get fullImagePath {
    if (imagePath != null) {
      return 'https://cdn.thesimpsonsapi.com/500$imagePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory FirstAppearance.fromRawJson(String str) =>
      FirstAppearance.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory FirstAppearance.fromJson(Map<String, dynamic> json) =>
      FirstAppearance(
        id: json["id"],
        airdate: DateTime.parse(json["airdate"]),
        description: json["description"],
        episodeNumber: json["episode_number"],
        imagePath: json["image_path"],
        name: json["name"],
        season: json["season"],
        synopsis: json["synopsis"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "airdate":
  //           "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
  //       "description": description,
  //       "episode_number": episodeNumber,
  //       "image_path": imagePath,
  //       "name": name,
  //       "season": season,
  //       "synopsis": synopsis,
  //     };
}
