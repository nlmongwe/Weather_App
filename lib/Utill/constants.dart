import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'helper.dart';
import '../model/getWeather.dart';

final GetWeather gw = GetWeather();
final Helper helper = Helper();
const Color mainDisplayColor = Color(0xff52B6D1);
const TextStyle mainDetailStyle = TextStyle(color: Colors.white, fontSize: 12);
const TextStyle listDetailStyle = TextStyle(color: Colors.white);

class KMainWeatherDisplay extends StatefulWidget {
  const KMainWeatherDisplay({Key? key, required this.function})
      : super(key: key);
  final Future<Weather> function;

  @override
  State<KMainWeatherDisplay> createState() => _KMainWeatherDisplayState();
}

class _KMainWeatherDisplayState extends State<KMainWeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.function,
        builder: (context, forecast) {
          if (forecast.hasData) {
            return Container(
              decoration: BoxDecoration(
                  color: mainDisplayColor,
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      scale: 0.5,
                      image: helper.getWeatherIcon(
                          forecast.data!.weatherIcon.toString())),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    forecast.data!.areaName.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(forecast.data!.tempMax!.celsius!.toInt().toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40)),
                      const Text('/',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(forecast.data!.tempMin!.celsius!.toInt().toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            forecast.data!.weatherDescription.toString(),
                            style: mainDetailStyle,
                          ),
                          Text(
                            helper.getWindSpeedInKilometersPerHour(
                                forecast.data!.windSpeed!.toInt()),
                            style: mainDetailStyle,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              helper.getHumidity(forecast.data!.humidity!),
                              style: mainDetailStyle,
                            ),
                            Text(
                              helper.getPressureInKPa(forecast.data!.pressure!),
                              style: mainDetailStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container(
            height: 300.00,
            decoration: BoxDecoration(
                color: mainDisplayColor,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 100))),
            child: const Center(
                child: CircularProgressIndicator(
              color: Color(0xff0A1928),
            )),
          );
        });
    //
  }
}

class KFiveDayListDisplay extends StatelessWidget {
  const KFiveDayListDisplay({Key? key, required this.function})
      : super(key: key);
  final Future<List<Weather>> function;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Weather>>(
        future: function,
        builder: (context, fiveDayForecast) {
          if (fiveDayForecast.hasData) {
            return Expanded(
                child: ListView.builder(
                    itemCount: fiveDayForecast.data?.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        leading: Image(
                            image: helper.getWeatherIcon(fiveDayForecast
                                .data![index].weatherIcon
                                .toString())),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              fiveDayForecast.data![index].areaName.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              helper.getDaysOfTheWeek(
                                  fiveDayForecast.data![index].date!.weekday -
                                      1),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              helper.getTimeOfDay(
                                  fiveDayForecast.data![index].date!.hour),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Max ${fiveDayForecast.data![index].tempMax!.celsius!.toInt().toString()}",
                              style: listDetailStyle,
                            ),
                            Text(
                              fiveDayForecast.data![index].weatherDescription
                                  .toString(),
                              style: listDetailStyle,
                            ),
                            Text(
                              "Min ${fiveDayForecast.data![index].tempMin!.celsius!.toInt().toString()}",
                              style: listDetailStyle,
                            )
                          ],
                        ),
                      );
                    }));
          }
          return const SizedBox(
              height: 200,
              child: Center(
                  child: CircularProgressIndicator(
                color: mainDisplayColor,
              )));
        });
  }
}
