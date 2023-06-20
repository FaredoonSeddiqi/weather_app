import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wapp/weathernodel.dart';

class weatherdata {
  Future<WeatherModel> getdata(var latiude, var longitude) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=1a2038ce2fcc4afaa66140523230906&q=$latiude,$longitude&aqi=no');
    var resp = await http.get(uricall);
    var body = jsonDecode(resp.body);
    return WeatherModel.fromJson(body);
  }
}
