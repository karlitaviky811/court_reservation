import 'package:court_reservation/shared/services/weather_service.dart';
import 'package:flutter/material.dart';

import 'package:court_reservation/shared/services/court_service.dart';
import '../../core/models/court.dart';
import '../../core/models/weather.dart';

class CourtProvider extends ChangeNotifier {
  List<Court> _courtList = [];
  Weather? _weather;

  final WeatherService _weatherService = WeatherService();

  List<Court> get courtList => _courtList;

  Future<void> fetchCourt() async {
    _courtList = await CourtService.fetchCourts();
    try {
      final data = await _weatherService.fetchWeather();
      _weather = Weather.fromJson(data);

      for (var court in _courtList) {
        court.rainy = _weather?.humidity ?? 0;
      }
    } catch (e) {
      _weather = null;
    } finally {
      notifyListeners();
    }
  }

  getCourtById(int id) {
    return _courtList.firstWhere((court) => court.id == id);
  }
}
