import 'package:films_app/models/movie.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        appBar: AppBar(title: const Text('Películas')),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _DetailHeader(movie: movie),
                const SizedBox(height: 20),
                Text(movie.overview),
                const SizedBox(height: 10),
                Text(movie.overview),
              ],
            ),
          ),
        ));
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: FadeInImage(
              height: 150,
              width: 100,
              placeholder: const AssetImage(
                'images/placeholder-image.png',
              ),
              image: NetworkImage(
                movie.posterFullPath,
              )),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                movie.originalTitle,
                style: textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_border),
                  Text(' ${movie.voteAverage}', style: textTheme.labelSmall),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
