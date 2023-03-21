import 'package:flutter/material.dart';

class AppTheme {
  static const seedColor = Colors.blueGrey;
  final _colorScheme = ColorScheme.fromSeed(seedColor: seedColor);
  final _darkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: seedColor, brightness: Brightness.dark);

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: _colorScheme,
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: _darkColorScheme,
      );
}
