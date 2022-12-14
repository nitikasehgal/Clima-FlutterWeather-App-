import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const api_key = '294f1eac7a2d74f9dc91196387928361';
const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String name) async {
    var url = '$openweathermapurl?q=$name&appid=$api_key&units=metric';
    NetworkHelper hepler = NetworkHelper(url);
    var weatherdata = await hepler.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationweather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper netHelp = NetworkHelper(
        '$openweathermapurl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$api_key&units=metric');
    var weatherdata = await netHelp.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
