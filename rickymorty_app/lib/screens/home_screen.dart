import 'package:flutter/material.dart';
import 'package:rickymorty_app/screens/character_screens.dart';
import 'package:rickymorty_app/screens/episode_screens.dart';
import 'package:rickymorty_app/screens/location_screens.dart';

enum PageType {
  characters,
  locations,
  episodes,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const CharacterListScreen(),
    const LocationListScreen(),
    const EpisodeListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Rick and Morty App')),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.light,
              ))
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: _pages[_currentPageIndex]),
                NavigationBar(
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  selectedIndex: _currentPageIndex,
                  destinations: const <Widget>[
                    NavigationDestination(
                      icon: Icon(Icons.people_outlined),
                      selectedIcon: Icon(Icons.people),
                      label: 'Personajes',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.public_outlined),
                      selectedIcon: Icon(Icons.public),
                      label: 'Localizaciones',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.movie_outlined),
                      selectedIcon: Icon(Icons.movie),
                      label: 'Episodios',
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Row(children: [
              NavigationRail(
                onDestinationSelected: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                selectedIndex: _currentPageIndex,
                extended: constraints.maxWidth >= 700,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.people_outlined),
                    selectedIcon: Icon(Icons.people),
                    label: Text('Personajes'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.public_outlined),
                    selectedIcon: Icon(Icons.public),
                    label: Text('Localizaciones'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.movie_outlined),
                    selectedIcon: Icon(Icons.movie),
                    label: Text('Episodios'),
                  ),
                ],
              ),
              Expanded(child: _pages[_currentPageIndex])
            ]);
          }
        }),
      ),
    );
  }
}
