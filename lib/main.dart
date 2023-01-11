import 'package:flutter/material.dart';
import 'package:weather_report/pages/home.dart';

void main() {
  runApp(const WeatherReport());
}

class WeatherReport extends StatelessWidget {
  const WeatherReport({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xff0A1928),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xff52B6D1)),
      ),
      home: const HomePage(),
    );
  }
}
