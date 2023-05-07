import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickymorty_app/providers/providers.dart';
import 'package:rickymorty_app/screens/screens.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CharacterProvider()),
    ChangeNotifierProvider(create: (context) => LocationProvider()),
    ChangeNotifierProvider(create: (context) => EpisodeProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
          brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      routes: {
        '/characterDetail': (context) => const CharacterDetailScreen(),
        '/locationDetail': (context) => const LocationDetailScreen(),
        '/episodeDetail': (context) => const EpisodeDetailScreen(),
      },
    );
  }
}
