import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:rickymorty_app/models/models.dart';

class LocationProvider with ChangeNotifier {
  List<Location> _locations = [];

  List<Location> get locations => _locations;

  Future<List<Location>> fetchLocations() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      _locations = results
          .map((json) => Location(
                id: json["id"],
                name: json["name"],
                type: json["type"],
                dimension: json["dimension"],
                residents: json["residents"] == null
                    ? []
                    : List<String>.from(json["residents"]!.map((x) => x)),
                url: json["url"],
                created: json["created"] == null
                    ? null
                    : DateTime.parse(json["created"]),
              ))
          .toList();
      notifyListeners(); // SI UTILIZAS EL FUTURE NO NECESITAS PROVIDER
      return _locations;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
