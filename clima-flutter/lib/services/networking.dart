import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper({this.url});

  final String url;
  //'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'

  Future getData() async {
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      String data = res.body;
      // Print full JSON
      //print(data);

      return jsonDecode(data);
    } else
      print(res.statusCode);
  }
}