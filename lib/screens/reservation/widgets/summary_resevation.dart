import 'package:flutter/material.dart';
import 'package:court_reservation/core/utils/format_time.dart';

import '../../../core/models/court.dart';
import '../../../core/models/reservation.dart';

import '../../../core/constants/color.constant.dart';
import '../../../core/themes/app.styles.dart';
import '../../../core/utils/format_date.dart';

class SummaryReservation extends StatelessWidget {
  final Court court;
  final Reservation reservation;

  const SummaryReservation(
      {Key? key, required this.court, required this.reservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.only(left: 29.87, top: 20, right: 29.97, bottom: 30),
      decoration: BoxDecoration(color: ColorConstant.blueF4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumen',
            style: AppStyle.txtPoppinsMedium18Black,
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sports_tennis_outlined,
                        color: ColorConstant.black3D,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Cancha tipo ${court.type}',
                        style: AppStyle.txtPoppinsRegular12Black,
                      )
                    ],
                  ),
                  const SizedBox(height: 10.74),
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: ColorConstant.black3D,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Instructor:',
                        style: AppStyle.txtPoppinsRegular12Black,
                      ),
                      Text(
                        reservation.instructor != ''
                            ? ' ${reservation.instructor}'
                            : ' Ninguno',
                        style: AppStyle.txtPoppinsRegular12Black,
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: ColorConstant.black3D,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        formatDate(reservation.reservationDate),
                        style: AppStyle.txtPoppinsRegular12Black,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  const SizedBox(height: 10.74),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        color: ColorConstant.black3D,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${formatTime(reservation.timeInit, reservation.timeEnd).toString()} horas',
                        style: AppStyle.txtPoppinsRegular12Black,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
