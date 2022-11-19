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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
