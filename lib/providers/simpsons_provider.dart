import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class SimpsonsProvider extends ChangeNotifier {
  String _baseUrl = 'thesimpsonsapi.com';

  List<Character> personatges = [];
  List<Location> localitzacions = [];
  Map<int, GetCharactersExpanded> characterDetails = {};
  List<Episode> episodis = [];

  List<Character> characters = [];
  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 0;

  SimpsonsProvider() {
    getSimpsonsCharacters();
    getLocations();
    getEpisodes();
  }

  getSimpsonsCharacters() async {
    var url = Uri.https(
      _baseUrl,
      'api/characters',
    );

    final result = await http.get(url);
    final getCharactersResponse = GetCharacters.fromRawJson(result.body);

    personatges = getCharactersResponse.results;
    notifyListeners();
  }

  getLocations() async {
    var url = Uri.https(_baseUrl, 'api/locations');

    final result = await http.get(url);
    final getLocationsResponse = GetLocations.fromRawJson(result.body);

    localitzacions = getLocationsResponse.results;
    notifyListeners();
  }

  Future<GetCharactersExpanded> getSimpsonsCharactersExpanded(
      int characterId) async {
    var url = Uri.https(_baseUrl, 'api/characters/$characterId');

    final result = await http.get(url);
    final getCharactersExpandedResponse =
        GetCharactersExpanded.fromRawJson(result.body);

    characterDetails[characterId] = getCharactersExpandedResponse;
    return getCharactersExpandedResponse;
  }

  getEpisodes() async {
    var url = Uri.https(_baseUrl, 'api/episodes');

    final result = await http.get(url);
    final getEpisodesResponse = GetEpisodes.fromRawJson(result.body);

    episodis = getEpisodesResponse.results;
    notifyListeners();
  }

  Future<void> getSimpsonsCharactersByPage({int page = 1}) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();

    final url =
        Uri.https(_baseUrl, '/api/characters', {'page': page.toString()});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> results =
          jsonData['results']; // <-- aquí agafem la llista real

      if (results.isEmpty) {
        hasMore = false;
      } else {
        final newCharacters =
            results.map((e) => Character.fromJson(e)).toList();
        characters.addAll(newCharacters);
        currentPage = page;
      }
    } else {
      print('Error carregant pàgina $page: ${response.statusCode}');
    }

    isLoading = false;
    notifyListeners();
  }
}
