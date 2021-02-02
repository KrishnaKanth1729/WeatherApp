// are comments for explanation

// flutter farmer insights app done by rkrishnakanth for science quest

// importing libraries and classes
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:flutter/services.dart';

import 'package:myweather/widgets/Weather.dart';
import 'package:myweather/widgets/WeatherItem.dart';
import 'package:myweather/models/WeatherData.dart';
import 'package:myweather/models/ForecastData.dart';
import 'package:myweather/widgets/Insights.dart';

// the main loop
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // data variables
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;
  Location _location = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    loadWeather();
  }

  // defining user interface with data
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer\'s weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: Colors.greenAccent,
          appBar: AppBar(
            backgroundColor: Colors.cyanAccent,
            title: Text('Farmer\'s Weather',
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text("See your insights"),
            MyButton(weatherData), // the button for insights page
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0), // adding padding
                    child: weatherData != null
                        ? Weather(
                            weather: weatherData) // displaying weather data
                        : Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isLoading
                        ? CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor:
                                new AlwaysStoppedAnimation(Colors.black87),
                          )
                        : IconButton(
                            //refresh button to load new set of data
                            icon: new Icon(Icons.refresh_outlined),
                            tooltip: 'Refresh',
                            onPressed: loadWeather,
                            color: Colors.white,
                          ),
                  )
                ],
              ),
            ),
            SafeArea(
              // defining user interface
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  child: forecastData != null
                      ? ListView.builder(
                          itemCount: forecastData.list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => WeatherItem(
                              weather: forecastData.list.elementAt(index)))
                      : Container(),
                ),
              ),
            )
          ]))),
    );
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    LocationData ld;
    try {
      ld = await _location
          .getLocation(); // getting precise location with lat and lon coordinates using gps

      error = null;
    } on PlatformException catch (e) {
      // checking for location permission in device and raising an exception if it isn't enabled
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      ld = null;
    }

    if (ld != null) {
      final lat = ld.latitude;
      final lon = ld.longitude;

      final weatherResponse = await http.get(
          // calling api requests for weatherData
          'https://api.openweathermap.org/data/2.5/weather?APPID=1609afe50eaf590cb58d3c1fbfb37f2a&lat=${lat.toString()}&lon=${lon.toString()}&units=metric');
      final forecastResponse = await http.get(
          //calling api requests for forecastData
          'https://api.openweathermap.org/data/2.5/forecast?APPID=1609afe50eaf590cb58d3c1fbfb37f2a&lat=${lat.toString()}&lon=${lon.toString()}&units=metric');

      if (weatherResponse.statusCode ==
              200 && // checking if api call is success and passing data to program(200 is success and 404 is error)
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData = new WeatherData.fromJson(jsonDecode(weatherResponse
              .body)); // taking the body of json api response and decoding to -utf8' for weatherData
          forecastData = new ForecastData.fromJson(jsonDecode(forecastResponse
              .body)); // taking the body of json api response and decoding to -utf8' for forecastData
          isLoading = false;
        });
      }
    }

    setState(() {
      // checking for changes and stop loading the data
      isLoading = false;
    });
  }
}

// the button that passes data to the insights page from the main page
class MyButton extends StatefulWidget {
  // the button that passes weatherData to the insights page
  WeatherData weatherData;
  MyButton(@required this.weatherData);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        // creating the UI icon
        icon: Icon(Icons.insights_rounded),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  // passing the route when it is pressed
                  builder: (context) => SecondScreen(widget
                      .weatherData))); //passing the weatherData in he button so that the nsights page can access it
        });
  }
}
