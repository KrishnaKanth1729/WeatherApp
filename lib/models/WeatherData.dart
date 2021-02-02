// flutter app done by rkrishnakanth for science quest

// tells the format in which the data from the api should be retrieved
class WeatherData {
  // fields required for Weather Data
  DateTime date = DateTime.now();
  String name = '';
  double temp = 0.0;
  String main = '';
  String icon = '';

  WeatherData({this.date, this.name, this.temp, this.main, this.icon}); // required parameters for calling this class

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData( // defined the class Widget for Weather Data on home page
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
  factory WeatherData.fromJson1(Map<String, dynamic> json) {
    return WeatherData( // defined the class Widget for Weather Data on insights page
      date: new DateTime.fromMillisecondsSinceEpoch(json['date'],
          isUtc: false),
      name: json['name'],
      temp: json['temp'].toDouble(),
      main: json['main'],
      icon: json['icon'],
    );
  }
}
