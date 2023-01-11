import 'package:flutter/material.dart';
import 'package:weather_report/pages/secondary.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchCity = "null";
  final TextEditingController _searchController =
      TextEditingController(text: 'City name');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff52B6D1),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 300,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                    child: Text(
                      'Search By City',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff0A1928),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Container(
                      height: 10,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: TextField(
                      controller: _searchController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _openSearch(_searchCity);
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          )),
                      onSubmitted: (String input) {
                        setState(() {
                          _searchCity = input;
                          _openSearch(_searchCity);
                        });
                      },
                      onChanged: (String input) {
                        _searchCity = input;
                      },
                      onTap: () {
                        _searchController.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _openSearch(String? searchCity) {
    if (searchCity == 'null') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'please enter city name',
          style: TextStyle(color: Color(0xff0A1928)),
        ),
        backgroundColor: Color(0xff52B6D1),
      ));
    } else if (_searchCity == "" || _searchCity == " ") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'please enter city name',
          style: TextStyle(color: Color(0xff0A1928)),
        ),
        backgroundColor: Color(0xff52B6D1),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (builder) => WeatherByCity(city: _searchCity)));
    }
  }
}
