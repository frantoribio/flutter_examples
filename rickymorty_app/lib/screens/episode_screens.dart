import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickymorty_app/models/models.dart';
import 'package:rickymorty_app/providers/providers.dart';

class EpisodeListScreen extends StatelessWidget {
  const EpisodeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final episodeProvider = Provider.of<EpisodeProvider>(context);
    final episodes = episodeProvider.episodes;

    return Scaffold(
      body: episodes.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                final episode = episodes[index];
                return ListTile(
                  title: Text(episode.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Air Date: ${episode.airDate}'),
                      Text('Episode: ${episode.episode}'),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/episodeDetail',
                      arguments: episode,
                    );
                  },
                );
              },
            ),
    );
  }
}

class EpisodeDetailScreen extends StatelessWidget {
  const EpisodeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final episode = ModalRoute.of(context)!.settings.arguments as Episode;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(episode.name)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${episode.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Air Date: ${episode.airDate}',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Episode: ${episode.episode}'),
            Text('Created: ${episode.created}'),
          ],
        ),
      ),
    );
  }
}
