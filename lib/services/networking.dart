
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  
  final String url;
  NetworkHelper({this.url});

  Future getData() async{
    var url=Uri.parse(this.url);
    http.Response response=await http.get(url);

    if(response.statusCode==200){
      String data=response.body;
      var decodeData=jsonDecode(data);
      return decodeData;
    }else{
      print(response.statusCode);
    }
  }  
}