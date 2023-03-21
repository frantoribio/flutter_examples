import 'package:films_app/providers/movies_provider.dart';
import 'package:films_app/screens/detail_screen.dart';
import 'package:films_app/screens/home_screen.dart';
import 'package:films_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const PeliculasApp(),
    ),
  );
}

class PeliculasApp extends StatelessWidget {
  const PeliculasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().darkTheme,
      initialRoute: '/',
      //initialRoute: '/detail',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen()
      },
    );
  }
}
