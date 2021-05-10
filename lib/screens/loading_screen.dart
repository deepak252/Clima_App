import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/screens/location_screen.dart';
import 'package:myapp/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>  {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData () async
  {
    var weatherData=await WeatherModel().getLocationWeather();   
    //////////////////  PUSHING ROUTE ---------
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: weatherData,)));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size:100,
        )
        // child: RaisedButton(
        //   onPressed: () {
        //     getLocationData();
            
        //   },
        //   child: Text('Get Location'),
        // ),
      ),
    );
  }
}


// print(data);
      // var longitude=jsonDecode(data)["weather"][0]["id"];
      // print("longitude = $longitude");
