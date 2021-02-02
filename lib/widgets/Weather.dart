// flutter app by rkrishnakanth for science quest

// importing dependencies and classes
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:myweather/models/WeatherData.dart';

// defines how the data collected should be displayed on the UI (user interface)
class Weather extends StatelessWidget {
  final WeatherData weather;

  Weather({Key key, @required this.weather})
      : super(key: key); // required parameters for calling class Weather
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weather.name,
            style: new TextStyle(color: Colors.limeAccent, fontSize: 35)),
        Text(weather.main,
            style: new TextStyle(color: Colors.white, fontSize: 32.0)),
        Text('${weather.temp.toString()}°C',
            style: new TextStyle(color: Colors.white)),
        Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
        Text(new DateFormat.Hm().format(weather.date),
            style: new TextStyle(color: Colors.black)),
        Text(new DateFormat.yMMMMEEEEd().format(weather.date))
      ],
    );
  }
}
