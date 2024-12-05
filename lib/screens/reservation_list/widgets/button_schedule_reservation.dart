import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

import '../../../core/constants/color.constant.dart';
import '../../../core/themes/app.styles.dart';

class ButtonScheduleReservation extends StatelessWidget {
  final VoidCallback onTap;

  const ButtonScheduleReservation({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: CustomElevatedButton(
          onTap: onTap,
          variant: ButtonVariant.Solid,
          height: 53,
          color: ColorConstant.green82,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_month),
              const SizedBox(width: 14.5),
              Text(
                'Programar reserva',
                style: AppStyle.txtPoppinsSemiBold18White,
              ),
            ],
          )),
    );
  }
}
