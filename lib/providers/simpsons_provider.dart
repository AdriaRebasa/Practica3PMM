import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class SimpsonsProvider extends ChangeNotifier {

  String _baseUrl = 'thesimpsonsapi.com';
  String _page = '1';

  List<Character> personatges = [];

  SimpsonsProvider() {
    this.getSimposonsCharacters();
  }

  getSimposonsCharacters() async{
      var url = Uri.https(_baseUrl, 'api/characters', {
      'page': _page,
      });

    final result = await http.get(url);
    final getCharactersResponse = GetCharacters.fromRawJson(result.body);

    personatges = getCharactersResponse.results;
    notifyListeners();
  }
}