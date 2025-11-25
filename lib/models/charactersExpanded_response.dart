import 'models.dart';

class GetCharactersExpanded {
  int id;
  int? age;
  DateTime? birthdate;
  String description;
  int? firstAppearanceEpId;
  int? firstAppearanceShId;
  String gender;
  String name;
  String occupation;
  List<String> phrases;
  String? portraitPath;
  String status;
  FirstAppearance? firstAppearanceEp;
  FirstAppearance? firstAppearanceSh;

  GetCharactersExpanded({
    required this.id,
    this.age,
    this.birthdate,
    required this.description,
    this.firstAppearanceEpId,
    this.firstAppearanceShId,
    required this.gender,
    required this.name,
    required this.occupation,
    required this.phrases,
    this.portraitPath,
    required this.status,
    this.firstAppearanceEp,
    this.firstAppearanceSh,
  });

  String get fullPortraitPath {
    if (portraitPath != null && portraitPath!.isNotEmpty) {
      return 'https://cdn.thesimpsonsapi.com/500$portraitPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory GetCharactersExpanded.fromRawJson(String str) =>
      GetCharactersExpanded.fromJson(json.decode(str));

  factory GetCharactersExpanded.fromJson(Map<String, dynamic> json) =>
      GetCharactersExpanded(
        id: json["id"],
        age: json["age"],
        birthdate: json["birthdate"] != null && json["birthdate"] != ""
            ? DateTime.tryParse(json["birthdate"])
            : null,
        description: json["description"] ?? '',
        firstAppearanceEpId: json["first_appearance_ep_id"],
        firstAppearanceShId: json["first_appearance_sh_id"],
        gender: json["gender"] ?? 'Unknown',
        name: json["name"] ?? 'Unknown',
        occupation: json["occupation"] ?? '',
        phrases: json["phrases"] != null
            ? List<String>.from(json["phrases"])
            : [''],
        portraitPath: json["portrait_path"],
        status: json["status"] ?? 'Unknown',
        firstAppearanceEp: json["first_appearance_ep"] != null
            ? FirstAppearance.fromJson(json["first_appearance_ep"])
            : null,
        firstAppearanceSh: json["first_appearance_sh"] != null
            ? FirstAppearance.fromJson(json["first_appearance_sh"])
            : null,
      );
}

class FirstAppearance {
  int id;
  String name;
  String? imagePath;
  String description;
  int episodeNumber;
  int season;
  String synopsis;
  DateTime? airdate;

  FirstAppearance({
    required this.id,
    required this.name,
    this.imagePath,
    required this.description,
    required this.episodeNumber,
    required this.season,
    required this.synopsis,
    this.airdate,
  });

  String get fullImagePath {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return 'https://cdn.thesimpsonsapi.com/500$imagePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory FirstAppearance.fromRawJson(String str) =>
      FirstAppearance.fromJson(json.decode(str));

  factory FirstAppearance.fromJson(Map<String, dynamic> json) =>
      FirstAppearance(
        id: json["id"],
        name: json["name"] ?? 'Unknown',
        imagePath: json["image_path"],
        description: json["description"] ?? '',
        episodeNumber: json["episode_number"] ?? 0,
        season: json["season"] ?? 0,
        synopsis: json["synopsis"] ?? '',
        airdate: json["airdate"] != null && json["airdate"] != ""
            ? DateTime.tryParse(json["airdate"])
            : null,
      );
}
