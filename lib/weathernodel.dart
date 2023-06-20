class WeatherModel {
  late var cityName;
  double? gust;
  double? uv;
  double? wind_mph;
  double? Pressure;
  double? precip_mm;
  String? last_update;
  late var icon;

  //
  WeatherModel({
    required this.cityName,
    required this.gust,
    required this.uv,
    required this.wind_mph,
    required this.precip_mm,
    required this.Pressure,
    required this.last_update,
    required this.icon,
  });

  //

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cityName = json["location"]["name"] as String;
    gust = json["current"]["gust_kph"] as double?;
    wind_mph = json["current"]["wind_kph"] as double?;
    uv = json["current"]["uv"] as double?;
    precip_mm = json["current"]["precip_mm"] as double?;
    Pressure = json["current"]["pressure_mb"] as double?;
    last_update = json["current"]["last_updated"] as String?;
    icon = json["current"]["condition"]["icon"] as String;
  }
}
