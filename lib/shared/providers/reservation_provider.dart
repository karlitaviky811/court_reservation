import 'package:court_reservation/core/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';

import '../../core/models/reservation.dart';

class ReservationProvider extends ChangeNotifier {
  List<Reservation> _reservationList = [];

  List<Reservation> get reservationList => _reservationList;

  Future<void> getReservationList() async {
    _reservationList = await Preferences.getReservationList();

    notifyListeners();
  }

  Future<void> removeReservation(Reservation reservation) async {
    await Preferences.removeReservation(reservation);

    _reservationList.removeWhere((item) => item.id == reservation.id);

    notifyListeners();
  }
}
