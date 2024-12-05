import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:court_reservation/shared/widgets/widgets.dart';

import '../../core/themes/app.styles.dart';
import '../../core/constants/color.constant.dart';
import 'package:court_reservation/core/utils/format_date.dart';

class ReservationItem extends StatelessWidget {
  final String courtName;
  final String image;
  final String? courtype;
  final String? scheduleDate;
  final int? rainy;
  final String? reservedBy;
  final String? cost;
  final int? quantityHour;

  const ReservationItem({
    Key? key,
    required this.courtName,
    this.courtype,
    this.scheduleDate,
    this.rainy,
    this.reservedBy,
    required this.image,
    this.cost,
    this.quantityHour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _CardScheduledReservationtImage(
          image: 'assets/images/$image.png',
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    courtName,
                    style: AppStyle.txtPoppinsSemiBold16Black,
                  ),
                  if (rainy != null)
                    Row(
                      children: [
                        const CustomIcon(icon: 'rainy_icon', size: 16),
                        const SizedBox(width: 4),
                        Text('$rainy %')
                      ],
                    )
                ],
              ),
              if (courtype != null) Text('Cancha tipo $courtype'),
              const SizedBox(height: 6),
              if (scheduleDate != null)
                _CardScheduledReservationToday(scheduleDate: scheduleDate!),
              const SizedBox(height: 8),
              if (reservedBy != null)
                Row(
                  children: [
                    Text('Reservado por: ',
                        style: AppStyle.txtPoppinsRegular12Black),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/profile.png')),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(width: 4),
                    Text(reservedBy!, style: AppStyle.txtPoppinsRegular12Black)
                  ],
                ),
              const SizedBox(height: 10),
              if (quantityHour != null)
                Row(
                  children: [
                    const CustomIcon(icon: 'clock_icon'),
                    const SizedBox(width: 8),
                    if (quantityHour != null)
                      Text('$quantityHour horas',
                          style: AppStyle.txtPoppinsRegular12Black),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('|'),
                    ),
                    if (cost != null)
                      Text('\$$cost', style: AppStyle.txtPoppinsRegular12Black),
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}

class _CardScheduledReservationToday extends StatelessWidget {
  final String scheduleDate;

  const _CardScheduledReservationToday({
    super.key,
    required this.scheduleDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomIcon(icon: 'calendar_icon'),
        const SizedBox(width: 8),
        Text(
          formatDate(scheduleDate),
          style: AppStyle.txtPoppinsRegular12Black,
        ),
      ],
    );
  }
}

class _CardScheduledReservationtImage extends StatelessWidget {
  const _CardScheduledReservationtImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConstant.whiteEE),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
