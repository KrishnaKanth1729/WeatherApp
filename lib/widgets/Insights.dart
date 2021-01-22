import 'package:flutter/material.dart';
import 'package:myweather/widgets/Weather.dart';
import 'package:myweather/models/WeatherData.dart';

WeatherData d = WeatherData.fromJson1({'date': DateTime.now().millisecondsSinceEpoch, 'name': '', 'temp': 0.0, 'main': '', 'icon': ''});



class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your insights"),
        backgroundColor: Colors.amber,
      ),
      body:

      Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home_outlined),
          ),
          Text(d.temp.toString(), style: new TextStyle(color: Colors.limeAccent, fontSize: 35)),
        ],
      )
    );
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
        Text(d.name, style: new TextStyle(color: Colors.limeAccent, fontSize: 35)),
       ],
    );


  }
}
