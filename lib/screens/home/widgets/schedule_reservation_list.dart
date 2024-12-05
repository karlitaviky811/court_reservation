import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

import '../../../shared/services/court_service.dart';

import '../../../core/models/court.dart';
import '../../../core/models/reservation.dart';

import '../../../core/shared_preferences/preferences.dart';

import '../../../core/constants/color.constant.dart';
import 'package:court_reservation/core/utils/format_time.dart';

class ScheduleReservationList extends StatelessWidget {
  const ScheduleReservationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Preferences.getReservationList(),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Si estamos cargando los datos, mostramos un indicador de carga
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Si hubo un error al cargar los datos, mostramos un mensaje de error
          return const Center(child: Text('Error al cargar los datos'));
        } else {
          return ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Reservation reservation = snapshot.data[index];
                Court court = CourtService.getCourtById(reservation.courtId);

                return Container(
                    padding: const EdgeInsets.only(top: 13, left: 19),
                    width: double.infinity,
                    height: 148,
                    color: ColorConstant.blueF4,
                    child: ReservationItem(
                      courtName: court.courtName,
                      image: court.image,
                      scheduleDate: reservation.reservationDate,
                      courtype: court.type,
                      reservedBy: reservation.reserveBy,
                      cost: court.cost,
                      quantityHour:
                          formatTime(reservation.timeInit, reservation.timeEnd),
                    ));
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8));
        }
      },
    );
  }
}
