import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/screens/location_screen.dart';
import 'package:myapp/services/location.dart';
import 'package:myapp/services/networking.dart';


const apiKey='ca5b428a413b4a273b302a8befd5d166';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>  {
  double latitude,longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData () async
  {
    Location location=Location();
    await location.getCurrentLocation();
    
    latitude=location.latitude;
    longitude=location.longitude;

    NetworkHelper networkHelper=NetworkHelper(url:'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$apiKey');
    
    var weatherData=await networkHelper.getData();
    print(weatherData["name"]);
    //////////////////  PUSHING ROUTE ---------
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
    
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
