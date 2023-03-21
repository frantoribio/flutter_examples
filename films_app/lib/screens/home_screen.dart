import 'package:films_app/providers/movies_provider.dart';
import 'package:films_app/widgets/movie_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Películas')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSlider(
              movies: moviesProvider.nowPlayingMovies,
              title: 'Películas en cartelera',
            ),
            MovieSlider(
              movies: moviesProvider.nowPlayingMovies,
              title: 'Próximos estrenos',
            ),
            MovieSlider(
              movies: moviesProvider.nowPlayingMovies,
              title: 'En alquiler',
            ),
            MovieSlider(
              movies: moviesProvider.nowPlayingMovies,
              title: 'Mas vistas',
            ),
            MovieSlider(
              movies: moviesProvider.nowPlayingMovies,
              title: 'Favoritas',
            ),
          ],
        ),
      ),
    );
  }
}
