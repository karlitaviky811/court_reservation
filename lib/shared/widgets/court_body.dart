import 'package:flutter/material.dart';

import 'package:court_reservation/shared/widgets/custom_icon.dart';

import '../../core/models/court.dart';

import '../../core/themes/app.styles.dart';
import '../../core/constants/color.constant.dart';

class CourtBody extends StatelessWidget {
  const CourtBody({
    super.key,
    required this.court,
  });

  final Court court;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              court.courtName,
              style: AppStyle.txtPoppinsRegular18Black,
            ),
            Row(
              children: [
                CustomIcon(
                  icon: 'rainy_icon',
                  color: ColorConstant.blue34,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('${court.rainy} %')
              ],
            )
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Cancha tipo ${court.type}',
          style: AppStyle.txtPoppinsRegular12Black,
        ),
        const SizedBox(height: 14),
        _CardPreviewCourtToday(date: court.availableDate),
        const SizedBox(height: 14),
        Row(children: [
          Text(
            'Disponible',
            style: AppStyle.txtPoppinsRegular12Black,
          ),
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: ColorConstant.blue34,
                borderRadius: BorderRadius.circular(50)),
          ),
          const SizedBox(width: 8),
          const CustomIcon(icon: 'clock_icon'),
          const SizedBox(width: 4),
          Text(
            court.availableSchedule,
            style: AppStyle.txtPoppinsRegular12Black,
          )
        ]),
      ],
    );
  }
}

class _CardPreviewCourtToday extends StatelessWidget {
  final String date;

  const _CardPreviewCourtToday({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomIcon(icon: 'calendar_icon'),
        const SizedBox(width: 8),
        Text(
          date,
          style: AppStyle.txtPoppinsRegular12Black,
        ),
      ],
    );
  }
}
