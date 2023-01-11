import 'package:flutter/cupertino.dart';

class Helper {
  String getDaysOfTheWeek(int weekday) {
    int dateTime = DateTime.now().weekday;
    List<String> weekDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    if (dateTime - 1 == weekday) {
      return "Today";
    }
    if (dateTime == weekday) {
      return "Tomorrow";
    }
    if ((dateTime + weekday) == 7) {
      return 'tomorrow';
    }
    return weekDays[weekday];
  }

  String getTimeOfDay(int hour) {
    if (hour.toString().length == 1) {
      return '0$hour:00';
    }
    return '$hour:00';
  }

  String getTimeOfDayHoursMin(int hour, int min) {
    if (hour.toString().length == 1 && min.toString().length == 1) {
      return '0$hour:0$min';
    } else if (hour.toString().length == 1) {
      return '0$hour:$min';
    } else if (min.toString().length == 1) {
      return '$hour:0$min';
    } else {
      return '$hour:$min';
    }
  }

  NetworkImage getWeatherIcon(String iconId) {
    return NetworkImage('http://openweathermap.org/img/w/$iconId.png');
  }

  String getWindSpeedInKilometersPerHour(int metersPerSecond) {
    return 'wind speed ${metersPerSecond / 1000} km/h';
  }

  String getHumidity(double humidity) {
    return 'Humidity $humidity%';
  }

  String getPressureInKPa(double pascals) {
    return 'Pressure ${pascals / 1000} Kpa';
  }
}
