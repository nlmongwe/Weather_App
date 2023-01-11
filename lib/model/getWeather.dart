import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_report/model/locator.dart';

class GetWeather {
  static const String _key = "2bfa89d4d562dfb6e2e8227daf59f0a1";
  // static const String _city = 'Pretoria';
  final Locator locator = Locator();
  WeatherFactory wf = WeatherFactory(_key, language: Language.ENGLISH);

  Future<Weather> getWeatherByLocation() async {
    Position currentPosition = await locator.getCurrentLocation();
    double lat = currentPosition.latitude;
    double long = currentPosition.longitude;
    Weather weather = await wf.currentWeatherByLocation(lat, long);
    return weather;
  }

  Future<List<Weather>> getFiveDayForecastByLocation() async {
    Position currentPosition = await locator.getCurrentLocation();
    double lat = currentPosition.latitude;
    double long = currentPosition.longitude;
    List<Weather> fiveDayForecast =
        await wf.fiveDayForecastByLocation(lat, long);

    return fiveDayForecast;
  }

  Future<Weather> getWeatherByCity(String city) async {
    Weather weather = await wf.currentWeatherByCityName(city);
    return weather;
  }

  Future<List<Weather>> getFiveDayForecastByCity(String city) async {
    List<Weather> fiveDayForecast = await wf.fiveDayForecastByCityName(city);
    return fiveDayForecast;
  }
}
