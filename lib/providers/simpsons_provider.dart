import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class SimpsonsProvider extends ChangeNotifier {

  String _baseUrl = 'thesimpsonsapi.com';
  String _page = '1';

  List<Character> personatges = [];
  List<Location> localitzacions = [];
  Map<int, GetCharactersExpanded> characterDetails = {};
  List<Episode> episodis = [];

  SimpsonsProvider() {
    getSimpsonsCharacters();
    getLocations();
    getEpisodes();
  }

  getSimpsonsCharacters() async{
    var url = Uri.https(_baseUrl, 'api/characters');

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

  Future<GetCharactersExpanded> getSimpsonsCharactersExpanded(int characterId) async{
      var url = Uri.https(_baseUrl, 'api/characters/$characterId');

    final result = await http.get(url);
    final getCharactersExpandedResponse = GetCharactersExpanded.fromRawJson(result.body);

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
}