import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

import '../../../core/models/court.dart';

import '../../../core/themes/app.styles.dart';

import 'package:court_reservation/core/constants/tag.constant.dart';
import '../../../core/constants/color.constant.dart';

class PaymentReservation extends StatelessWidget {
  final Court court;
  final VoidCallback onPayment;
  final VoidCallback onCancel;

  const PaymentReservation({
    super.key,
    required this.onCancel,
    required this.onPayment,
    required this.court,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 29, right: 28, top: 27),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TagConstant.totalPayment,
                style: AppStyle.txtPoppinsMedium18Black,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${court.cost}',
                    style: AppStyle.txtPoppinsSemiBold18Blue,
                  ),
                  Text(
                    'Por 2 horas',
                    style: AppStyle.txtPoppinsRegular12Gray,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          CustomElevatedButton(
              onTap: () {},
              width: 280,
              color: ColorConstant.blue34,
              variant: ButtonVariant.Outline,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: ColorConstant.blue34,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    TagConstant.rescheduleReservation,
                    style: AppStyle.txtPoppinsMedium18Blue,
                  )
                ],
              )),
          const SizedBox(height: 40),
          CustomElevatedButton(
              onTap: onPayment,
              color: ColorConstant.green82,
              variant: ButtonVariant.Solid,
              child: Text(
                TagConstant.pay,
                style: AppStyle.txtPoppinsSemiBold18White,
              )),
          const SizedBox(height: 20),
          CustomElevatedButton(
              onTap: onCancel,
              color: ColorConstant.black3D,
              variant: ButtonVariant.Outline,
              child: Text(
                TagConstant.cancel,
                style: AppStyle.txtPoppinsSemiBold18Black,
              )),
        ],
      ),
    );
  }
}
