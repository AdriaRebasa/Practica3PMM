import 'models.dart';

class Location {
    int id;
    String name;
    String imagePath;
    String town;
    String use;

    Location({
        required this.id,
        required this.name,
        required this.imagePath,
        required this.town,
        required this.use,
    });

    get fullImagePath {
    if (imagePath != null) {
      return 'https://cdn.thesimpsonsapi.com/500$imagePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  } 

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        imagePath: json["image_path"],
        town: json["town"] ?? 'Unknown',
        use: json["use"] ?? 'Unknown',
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "image_path": imagePath,
    //     "town": townValues.reverse[town],
    //     "use": use,
    // };
}
