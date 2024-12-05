class Weather {
  final String city;
  final String description;
  final double temperature;
  final int humidity;

  Weather(
      {required this.city,
      required this.description,
      required this.temperature,
      required this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['name'],
        description: json['weather'][0]['description'],
        temperature: json['main']['temp'],
        humidity: json['main']['humidity']);
  }
}
