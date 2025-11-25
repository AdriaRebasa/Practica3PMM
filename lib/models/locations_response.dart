import 'models.dart';

class GetLocations {
    int count;
    String next;
    dynamic prev;
    int pages;
    List<Locations> results;

    GetLocations({
        required this.count,
        required this.next,
        required this.prev,
        required this.pages,
        required this.results,
    });

    factory GetLocations.fromRawJson(String str) => GetLocations.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory GetLocations.fromJson(Map<String, dynamic> json) => GetLocations(
        count: json["count"],
        next: json["next"],
        prev: json["prev"],
        pages: json["pages"],
        results: List<Locations>.from(json["results"].map((x) => Locations.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "count": count,
    //     "next": next,
    //     "prev": prev,
    //     "pages": pages,
    //     "results": List<dynamic>.from(results.map((x) => x.toJson())),
    // };
}
