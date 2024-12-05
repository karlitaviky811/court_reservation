import 'package:court_reservation/shared/services/weather_service.dart';
import 'package:flutter/material.dart';

import '../../core/models/weather.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _weatherService.fetchWeather();
      _weather = Weather.fromJson(data);
    } catch (e) {
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
