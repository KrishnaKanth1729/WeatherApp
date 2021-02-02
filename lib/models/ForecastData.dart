//flutter app done by rkrishnakanth for science quest

import 'package:myweather/models/WeatherData.dart';

//defines the structure in which the data should be retrieved for forecast
class ForecastData {
  final List list;

  ForecastData({this.list}); // defining parameters for when tis class is called

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = new List(); // forecast data will be a list

    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData( // defining the fields to extract from the json api
          date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000,
              isUtc: false),
          name: json['city']['name'],
          temp: e['main']['temp'].toDouble(),
          main: e['weather'][0]['main'],
          icon: e['weather'][0]['icon']);
      list.add(w);
    }

    return ForecastData( // defines what value will be returned by the class
      list: list,
    );
  }
}
