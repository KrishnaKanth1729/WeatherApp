// flutter app done by rkrishnakanth for science quest

//importing dependencies and classes
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:myweather/models/WeatherData.dart';

// defining the weather class
class WeatherItem extends StatelessWidget {
  final WeatherData weather; // a variable of type WeatherData

  WeatherItem({Key key, @required this.weather}) : super(key: key);  // initiating the required parameters when the class is called

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // adding padding on sides of the widgets
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name, style: new TextStyle(color: Colors.black)), // displays the name of locality with the help of the gps navigation
            Text(weather.main,
                style: new TextStyle(color: Colors.black, fontSize: 24.0)), // shows description of weather like rain, cloudy, haze etc.
            Text('${weather.temp.toString()}°C',
                style: new TextStyle(color: Colors.black)), // shows temp in °C
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMMMd().format(weather.date),//  shows time in year, month and day
                style: new TextStyle(color: Colors.black)),
            Text(new DateFormat.Hm().format(weather.date), // shows the time in hour and minutes
                style: new TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
