import 'pages/results_page.dart';
import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0F0F1F),
        scaffoldBackgroundColor: Color(0xFF0A0E11),
      ),
    );
  }
}
