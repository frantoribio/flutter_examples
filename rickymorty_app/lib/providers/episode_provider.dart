import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:rickymorty_app/models/models.dart';

class EpisodeProvider with ChangeNotifier {
  List<Episode> _episodes = [];

  List<Episode> get episodes => _episodes;

  EpisodeProvider() {
    fetchEpisodes();
  }

  Future<void> fetchEpisodes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      _episodes = results
          .map((json) => Episode(
                id: json["id"],
                name: json["name"],
                airDate: json["air_date"],
                episode: json["episode"],
                characters: json["characters"] == null
                    ? []
                    : List<String>.from(json["characters"]!.map((x) => x)),
                url: json["url"],
                created: json["created"] == null
                    ? null
                    : DateTime.parse(json["created"]),
              ))
          .toList();
      notifyListeners();
    }
  }
}
