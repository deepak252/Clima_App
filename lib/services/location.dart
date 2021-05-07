import 'package:geolocator/geolocator.dart';
class Location{
  double latitude,longitude;
  // Location(

  // )
  Future<void> getCurrentLocation() async
  {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude; 
      // print('Latitude = $latitude , Longitude = $longitude');
    }catch(e){
      print(e);
    }
  }
}