import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:rickymorty_app/models/models.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  Future<void> fetchCharacters() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      _characters = results
          .map((json) => Character(
                id: json["id"],
                name: json["name"],
                status: json["status"],
                species: json["species"],
                type: json["type"],
                gender: json["gender"],
                image: json["image"],
                episode: json["episode"] == null
                    ? []
                    : List<String>.from(json["episode"]!.map((x) => x)),
                url: json["url"],
                origin: Location(
                    name: json["origin"]["name"], url: json["origin"]["url"]),
                location: Location(
                    name: json["location"]["name"],
                    url: json["location"]["url"]),
              ))
          .toList();
      notifyListeners();
    }
  }
}
