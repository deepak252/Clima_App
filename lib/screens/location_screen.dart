import 'package:flutter/material.dart';
import 'package:myapp/utilities/constants.dart';
import 'package:myapp/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherObject=WeatherModel();
  String cityName;
  int temperature;
  String weatherIcon;
  String weatherMessage;


  @override
  void initState() {
    super.initState();
    // print(widget.locationWeather);
    updateUI(widget.locationWeather);   
  }
  void updateUI(dynamic weatherData)
  {
    setState(() {
     cityName=weatherData["name"];
      double temp=weatherData['main']['temp'];
      temperature=temp.toInt();
      int condition=weatherData['weather'][0]['id'];

      weatherIcon=weatherObject.getWeatherIcon(condition);
      weatherMessage=weatherObject.getMessage(temperature); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// String cityName=jsonDecode(data)["name"];
//       double temperature=jsonDecode(data)['main']['temp'];
//       int condition=jsonDecode(data)['weather'][0]['id'];
//       print('$cityName $temperature  $condition'); 