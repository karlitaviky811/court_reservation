import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/court.dart';
import '../models/reservation.dart';
import '../models/user_model.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<User?> getUser() async {
    String? jsonString = _preferences.getString('user');

    if (jsonString != null) {
      return User.fromJson(jsonDecode(jsonString));
    }

    return null;
  }

  static Future<void> clearUser() async {
    await _preferences.remove('user');
  }

  static Future<void> saveUser(User user) async {
    await _preferences.setString('user', jsonEncode(user.toJson()));
  }

  static get reservationList =>
      _preferences.getStringList('reservation_list') ?? [];

  static Future<void> saveReservationList(
      List<Reservation> reservations) async {
    List<String> jsonStringList = reservations
        .map((reservation) => jsonEncode(reservation.toJson()))
        .toList();
    await _preferences.setStringList('reservation_list', jsonStringList);
  }

  static Future<List<Reservation>> getReservationList() async {
    List<String>? jsonStringList =
        _preferences.getStringList('reservation_list');

    if (jsonStringList != null) {
      return jsonStringList
          .map((jsonString) => Reservation.fromJson(jsonDecode(jsonString)))
          .toList();
    }

    return [];
  }

  static removeReservation(Reservation reservation) async {
    List<Reservation> reservationList = await getReservationList();

    reservationList.removeWhere((item) => item.id == reservation.id);

    saveReservationList(reservationList);
  }

  static saveFavoriteCourt(List<Court> courts) async {
    List<String> jsonStringList =
        courts.map((court) => jsonEncode(court.toJson())).toList();
    await _preferences.setStringList('court_list', jsonStringList);
  }

  static Future<List<Court>> getCourtList() async {
    List<String>? jsonStringList = _preferences.getStringList('court_list');

    if (jsonStringList != null) {
      List<Court> courts = jsonStringList
          .map((jsonString) => Court.fromJson(jsonDecode(jsonString)))
          .toList();
      return courts;
    }

    return [];
  }

  static removeCourt(Court court) async {
    List<Court> courtList = await getCourtList();

    courtList.removeWhere((item) => item.id == court.id);

    saveFavoriteCourt(courtList);
  }

  static Future<bool> belongToFavorite(Court court) async {
    List<Court> courtList = await getCourtList();

    return courtList.where((item) => item.id == court.id).isEmpty;
  }

  static clearAll() {
    _preferences.clear();
  }
}
