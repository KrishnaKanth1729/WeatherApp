import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:myweather/main.dart';
import 'package:myweather/models/ForecastData.dart';
import 'package:myweather/widgets/Weather.dart';
import 'package:myweather/models/WeatherData.dart';
import 'package:myweather/widgets/WeatherItem.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class SecondScreen extends StatelessWidget {
  WeatherData weatherData;
  String maintext;
  String anothertext;
  String text;
  String kannada;

  GoogleTranslator translator = GoogleTranslator();

  SecondScreen(this.weatherData);

  @override
  Widget build(BuildContext context) {
    if (weatherData.main.toString() == 'Rain') {
      if (weatherData.temp < 20) {
        anothertext =
            'You can skip or limit irrigation as there is a chance of rain';
        maintext =
            'It is advised not to sow your seeds today if you were plannning to as there is rain';
        kannada =
            'ಮಳೆಯಾಗುವುದರಿಂದ ನಿಮ್ಮ ಹೊಲಗಳಿಗೆ ನೀರಾವರಿ ನೀಡುವುದನ್ನು ನೀವು ಬಿಟ್ಟುಬಿಡಬಹುದು';
        text = 'बारिश होने के कारण आप खेत की सिंचाई करने जा सकते हैं';
      }
    } else {
      maintext =
          'You can sow your seeds tomorrow as there is a less chance of rain';
      anothertext = 'You can irrigate your fields tomorrow normally';
      kannada = 'ಮಳೆ ಇಲ್ಲದ ಕಾರಣ ನೀವು ಸಾಮಾನ್ಯವಾಗಿ ನಿಮ್ಮ ಬೆಳೆಗಳಿಗೆ ನೀರು ಹಾಕಬಹುದು';
      text =
          'आप अपनी फसलों को सामान्य रूप से पानी दे सकते हैं क्योंकि बारिश नहीं होती है';
    }
    return Scaffold(
        appBar: AppBar(
            title: Text("Your insights"), backgroundColor: Colors.cyanAccent),
        body: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.insights),
            ),
            ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                Text(maintext,
                    style: new TextStyle(color: Colors.black, fontSize: 35)),
                Text(anothertext,
                    style: new TextStyle(color: Colors.cyan, fontSize: 35)),
                Text(text,
                    style: new TextStyle(
                        color: Colors.lightGreenAccent, fontSize: 35)),
                Text(
                  kannada,
                  style: new TextStyle(color: Colors.deepOrange, fontSize: 35),
                )
              ],
            ),
          ],
        ));
  }
}

class MyText extends StatefulWidget {
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('', style: new TextStyle(color: Colors.limeAccent, fontSize: 35)),
      ],
    );
  }
}
