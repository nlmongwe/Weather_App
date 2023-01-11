import 'package:flutter/material.dart';
import 'package:weather_report/pages/search.dart';
import '../Utill/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
        actions: [
          IconButton(onPressed: _openSearch, icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: <Widget>[
            Expanded(
              flex: 2,
              child: KMainWeatherDisplay(
                function: gw.getWeatherByLocation(),
              ),
            ),
            KFiveDayListDisplay(function: gw.getFiveDayForecastByLocation()),
          ]),
        ),
      ),
    );
  }

  void _openSearch() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (builder) => const SearchPage()));
  }

}
