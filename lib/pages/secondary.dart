import 'package:flutter/material.dart';
import '../Utill/constants.dart';

class WeatherByCity extends StatefulWidget {
  const WeatherByCity({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  State<WeatherByCity> createState() => _WeatherByCityState();
}

class _WeatherByCityState extends State<WeatherByCity> {
  late String searchCity;

  @override
  void initState() {
    super.initState();
    searchCity = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff52B6D1),
        centerTitle: true,
        title: const Text('Search by city'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: KMainWeatherDisplay(
                function: gw.getWeatherByCity(searchCity),
              ),
            ),
            KFiveDayListDisplay(
                function: gw.getFiveDayForecastByCity(searchCity)),
          ],
        ),
      ),
    );
  }

}
