import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/widgets.dart';

import '../../../shared/providers/providers.dart';

import '../../../core/constants/color.constant.dart';
import '../../../core/themes/app.styles.dart';

class SummaryReservationForm extends StatelessWidget {
  final Function onTap;

  const SummaryReservationForm({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ReservationFormProvider reservationFormProvider =
        Provider.of<ReservationFormProvider>(context);

    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 2, color: ColorConstant.whiteEE));
    return Container(
      padding:
          const EdgeInsets.only(left: 32, right: 32, top: 26.5, bottom: 41),
      width: double.infinity,
      color: ColorConstant.blueF4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Establecer fecha y hora',
            style: AppStyle.txtPoppinsMedium18Black,
          ),
          const SizedBox(height: 20),
          CustomDatePickerField(
              label: 'Fecha',
              value: reservationFormProvider.reservation.reservationDate,
              placeholder: DateFormat.yMd().format(DateTime.now()),
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 8),
              onTap: null),
          const SizedBox(height: 20),
          CustomDatePickerField(
              label: 'Hora',
              value:
                  '${reservationFormProvider.reservation.timeInit} a ${reservationFormProvider.reservation.timeEnd} hrs',
              placeholder: '11:00 a 13:00 hrs',
              padding: const EdgeInsets.only(
                  left: 20, right: 6.7, top: 6, bottom: 8),
              onTap: null),
          const SizedBox(height: 24),
          Text(
            'Agregar un comentario',
            style: AppStyle.txtPoppinsMedium18Black,
          ),
          const SizedBox(height: 15.5),
          TextFormField(
            enabled: false,
            style: AppStyle.txtPoppinsRegular12Black,
            initialValue: reservationFormProvider.reservation.comment,
            onChanged: (value) =>
                reservationFormProvider.reservation.comment = value,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: ColorConstant.whiteFF,
                contentPadding: const EdgeInsets.all(16),
                focusedBorder: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                labelText: 'Agregar un comentario...',
                border: outlineInputBorder,
                labelStyle: AppStyle.txtPoppinsRegular14Gray,
                alignLabelWithHint: true),
            minLines:
                6, // any number you need (It works as the rows for the textarea)
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          const SizedBox(
            height: 45,
          ),
          CustomElevatedButton(
              variant: ButtonVariant.Solid,
              onTap: reservationFormProvider.isValidForm()
                  ? () {
                      reservationFormProvider.progress = 'step3';
                      // onTap();
                    }
                  : null,
              color: ColorConstant.green82,
              child: Text(
                'Reservar',
                style: AppStyle.txtPoppinsSemiBold18White,
              ))
        ],
      ),
    );
  }
}
