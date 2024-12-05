import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/models/court.dart';

class CourtService {
  static List<Court> courts = [];
  static Future<List<Court>> fetchCourts() async {
    String response = await rootBundle.loadString('assets/json/courts.json');
    final Map<dynamic, dynamic> data = json.decode(response);

    final List<dynamic> items = data['data'];

    List<Court> courtList = items.map((item) {
      return Court.fromJson(item);
    }).toList();

    courts = courtList;
    return courtList;
  }

  static Court getCourtById(int id) {
    return courts.firstWhere((court) => court.id == id);
  }
}
