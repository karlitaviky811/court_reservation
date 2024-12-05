import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '48ec46c9b7f8f442fcf8c1cf8f3d6e94';
  final String baseURL = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather() async {
    final response = await http
        .get(Uri.parse('$baseURL?q=Valencia&appid=$apiKey&units=imperial'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
