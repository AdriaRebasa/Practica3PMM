import 'models.dart';

class GetEpisodes {
    int count;
    String next;
    dynamic prev;
    int pages;
    List<Episode> results;

    GetEpisodes({
        required this.count,
        required this.next,
        required this.prev,
        required this.pages,
        required this.results,
    });

    factory GetEpisodes.fromRawJson(String str) => GetEpisodes.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory GetEpisodes.fromJson(Map<String, dynamic> json) => GetEpisodes(
        count: json["count"],
        next: json["next"],
        prev: json["prev"],
        pages: json["pages"],
        results: List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "count": count,
    //     "next": next,
    //     "prev": prev,
    //     "pages": pages,
    //     "results": List<dynamic>.from(results.map((x) => x.toJson())),
    // };
}
