import 'models.dart';

class Episode {
  int id;
  String airdate;
  int episodeNumber;
  String imagePath;
  String name;
  int season;
  String synopsis;

  Episode({
    required this.id,
    required this.airdate,
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

  factory Episode.fromRawJson(String str) => Episode.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        airdate: json["airdate"],
        episodeNumber: json["episode_number"],
        imagePath: json["image_path"],
        name: json["name"],
        season: json["season"],
        synopsis: json["synopsis"],
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "airdate": airdate,
  //     "episode_number": episodeNumber,
  //     "image_path": imagePath,
  //     "name": name,
  //     "season": season,
  //     "synopsis": synopsis,
  // };
}
