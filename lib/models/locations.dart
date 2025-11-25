import 'models.dart';

class Locations {
    int id;
    String name;
    String imagePath;
    String? town;
    String? use;

    Locations({
        required this.id,
        required this.name,
        required this.imagePath,
        this.town,
        this.use,
    });

    get fullImagePath {
    if (imagePath != null) {
      return 'https://cdn.thesimpsonsapi.com/500$imagePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  } 

    factory Locations.fromRawJson(String str) => Locations.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        name: json["name"],
        imagePath: json["image_path"],
        town: json["town"],
        use: json["use"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "image_path": imagePath,
    //     "town": townValues.reverse[town],
    //     "use": use,
    // };
}
