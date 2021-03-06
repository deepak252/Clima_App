import 'package:myapp/keys.dart';
import 'package:myapp/services/location.dart';
import 'package:myapp/services/networking.dart';

const apiKey=apiKEY;
const openWeatherMapURL='http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double latitude,longitude;

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper=NetworkHelper(url:'$openWeatherMapURL?q=$cityName&APPID=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location=Location();
    await location.getCurrentLocation();
    
    latitude=location.latitude;
    longitude=location.longitude;

    NetworkHelper networkHelper=NetworkHelper(url:'$openWeatherMapURL?lat=${location.latitude}&lon=$longitude&APPID=$apiKey&units=metric');
    
    var weatherData=await networkHelper.getData();
    return weatherData;
    // print(weatherData["name"]);
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
