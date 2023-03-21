import 'package:films_app/models/movie.dart';
import 'package:films_app/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseurl = 'api.themoviedb.org';
  final String _apiKey = 'TU-API-KEY';
  final String _language = 'es-ES';

  List<Movie> nowPlayingMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    print('Inicializando MoviesProvider');

    getOnDisplayMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseurl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    var response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    var body = await _getJsonData('3/movie/now_playing', 1);
    var nowPlaying = NowPlayingResponse.fromRawJson(body);
    nowPlayingMovies = nowPlaying.results;

    notifyListeners();
  }
}
