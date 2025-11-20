import 'models.dart';

class GetCharacters {
    int count;
    String next;
    dynamic prev;
    int pages;
    List<Character> results;

    GetCharacters({
        required this.count,
        required this.next,
        required this.prev,
        required this.pages,
        required this.results,
    });

    factory GetCharacters.fromRawJson(String str) => GetCharacters.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory GetCharacters.fromJson(Map<String, dynamic> json) => GetCharacters(
        count: json["count"],
        next: json["next"],
        prev: json["prev"],
        pages: json["pages"],
        results: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "count": count,
    //     "next": next,
    //     "prev": prev,
    //     "pages": pages,
    //     "results": List<dynamic>.from(results.map((x) => x.toJson())),
    // };
}