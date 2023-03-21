import 'package:adaptive_widgets_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AdaptiveWidgetsApp());

class AdaptiveWidgetsApp extends StatelessWidget {
  const AdaptiveWidgetsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Widgets Demo',
      //theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
