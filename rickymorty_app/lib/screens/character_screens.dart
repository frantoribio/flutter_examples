import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickymorty_app/models/models.dart';
import 'package:rickymorty_app/providers/providers.dart';
import 'package:rickymorty_app/widgets/image_grid_tile.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  void initState() {
    super.initState();
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: false);
    characterProvider.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    final characters = characterProvider.characters;

    return Scaffold(
      body: characters.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : GridView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return ImageGridTile(character: characters[index]);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    max((MediaQuery.of(context).size.width ~/ 200).toInt(), 2),
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
            ),
    );
  }
}

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(character.name)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.image),
            const SizedBox(height: 20),
            Text(
              'Name: ${character.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Species: ${character.species}'),
            Text('Gender: ${character.gender}'),
            Text('Location: ${character.location?.name}'),
            Text('Origin: ${character.origin?.name}'),
            Text('Status: ${character.status}'),
          ],
        ),
      ),
    );
  }
}
