import 'dart:convert';

import 'package:court_reservation/core/models/court.dart';

class Reservation {
  Reservation({
    required this.courtName,
    required this.reservationDate,
    required this.timeInit,
    required this.timeEnd,
    required this.comment,
    required this.schedule,
    required this.reserveBy,
    required this.id,
    required this.courtId,
    required this.instructor,
  });

  String courtName;
  String reservationDate;
  String timeInit;
  String timeEnd;
  String comment;
  String schedule;
  String id;
  String reserveBy;
  int courtId;
  String instructor;

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json['id'],
        courtName: json['courtName'],
        reserveBy: json['reserveBy'],
        reservationDate: json['reservationDate'],
        timeInit: json['timeInit'],
        timeEnd: json['timeEnd'],
        comment: json['comment'],
        schedule: json['schedule'],
        courtId: json['courtId'],
        instructor: json['instructor']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courtName': courtName,
      'reservationDate': reservationDate,
      'timeInit': timeInit,
      'timeEnd': timeEnd,
      'comment': comment,
      'reserveBy': reserveBy,
      'schedule': schedule,
      'courtId': courtId,
      'instructor': instructor
    };
  }

  @override
  String toString() {
    return "name: $courtName, reservationDate: $reservationDate, reserveBy: $reserveBy timeEnd: $timeEnd, timeInit: $timeInit, commt: $comment, schedule: $schedule, instructor: $instructor";
  }
}
