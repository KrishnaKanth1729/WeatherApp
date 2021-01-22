class WeatherData {
  DateTime date = DateTime.now();
  String name = '';
  double temp = 0.0;
  String main = '';
  String icon = '';

  WeatherData({this.date, this.name, this.temp, this.main, this.icon});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
  factory WeatherData.fromJson1(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['date'],
          isUtc: false),
      name: json['name'],
      temp: json['temp'].toDouble(),
      main: json['main'],
      icon: json['icon'],
    );
  }
}
