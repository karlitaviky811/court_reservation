import 'package:court_reservation/core/models/reservation.dart';
import 'package:court_reservation/core/utils/format_time.dart';
import 'package:flutter/material.dart';

class ReservationFormProvider extends ChangeNotifier {
  final Reservation _reservation = Reservation(
      id: '1',
      courtName: '',
      reservationDate: '',
      schedule: '',
      reserveBy: '',
      timeInit: '',
      timeEnd: '',
      comment: '',
      courtId: 0,
      instructor: '');

  String _progress = 'step1';

  String get progress => _progress;

  Reservation get reservation => _reservation;

  set updateDate(String value) {
    _reservation.reservationDate = value;
    notifyListeners();
  }

  set updateTimeInit(String value) {
    _reservation.timeInit = value;
    notifyListeners();
  }

  set updateTimeEnd(String value) {
    _reservation.timeEnd = value;
    notifyListeners();
  }

  set updateComment(String value) {
    _reservation.comment = value;
    notifyListeners();
  }

  set updateInstructor(String value) {
    _reservation.instructor = value;
    notifyListeners();
  }

  set progress(value) {
    _progress = value;
    notifyListeners();
  }

  isValidForm() {
    return _reservation.reservationDate != '' &&
        _reservation.timeInit != '' &&
        _reservation.timeEnd != '' &&
        formatTime(_reservation.timeInit, _reservation.timeEnd) >= 0;
  }
}
