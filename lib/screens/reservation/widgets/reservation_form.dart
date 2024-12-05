import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales

import '../../../shared/widgets/widgets.dart';

import '../../../shared/providers/providers.dart';

import 'package:court_reservation/core/models/reservation.dart';

import '../../../core/themes/app.styles.dart';
import '../../../core/constants/color.constant.dart';
import 'package:court_reservation/core/constants/tag.constant.dart';

class ReservationForm extends StatelessWidget {
  final Function onTap;

  const ReservationForm({
    super.key,
    required this.onTap,
  });

  void handleChangeDatePicker(BuildContext context,
      ReservationFormProvider reservationFormProvider) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 7)));

    if (picked != null && picked != selectedDate) {
      reservationFormProvider.reservation.reservationDate =
          DateFormat.yMd().format(picked);
      initializeDateFormatting('es');
    }
  }

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
            TagConstant.selectSchedule,
            style: AppStyle.txtPoppinsMedium18Black,
          ),
          const SizedBox(height: 20),
          CustomDatePickerField(
              label: 'Fecha',
              value: reservationFormProvider.reservation.reservationDate,
              placeholder: DateFormat.yMd().format(DateTime.now()),
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 8),
              onTap: () =>
                  handleChangeDatePicker(context, reservationFormProvider)),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 147.7),
              child: CustomDatePickerField(
                label: 'Hora de inicio',
                value: reservationFormProvider.reservation.timeInit,
                placeholder: '00:00',
                padding: const EdgeInsets.only(
                    left: 20, right: 6.7, top: 6, bottom: 8),
                onTap: () async {
                  DateTime? picked = await DatePicker.showTime12hPicker(
                    context,
                  );
                  DateTime selectedDate = DateTime.now();

                  if (picked != null && picked != selectedDate) {
                    reservationFormProvider.reservation.timeInit =
                        DateFormat.Hm().format(picked);
                  }
                },
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 147.7),
              child: CustomDatePickerField(
                label: 'Hora de fin',
                value: reservationFormProvider.reservation.timeEnd,
                placeholder: '00:00',
                padding: const EdgeInsets.only(
                    left: 20, right: 6.7, top: 6, bottom: 8),
                onTap: () async {
                  DateTime? picked = await DatePicker.showTime12hPicker(
                    context,
                  );
                  DateTime selectedDate = DateTime.now();

                  if (picked != null && picked != selectedDate) {
                    reservationFormProvider.reservation.timeEnd =
                        DateFormat.Hm().format(picked);
                  }
                },
              ),
            ),
          ]),
          const SizedBox(height: 24),
          Text(
            TagConstant.comment,
            style: AppStyle.txtPoppinsMedium18Black,
          ),
          const SizedBox(height: 15.5),
          TextFormField(
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
                      reservationFormProvider.progress = 'step2';
                      onTap(Reservation(
                          id: '',
                          courtName: '',
                          reservationDate: reservationFormProvider
                              .reservation.reservationDate,
                          timeInit:
                              reservationFormProvider.reservation.timeInit,
                          timeEnd: reservationFormProvider.reservation.timeEnd,
                          comment: reservationFormProvider.reservation.comment,
                          reserveBy:
                              reservationFormProvider.reservation.reserveBy,
                          schedule: '',
                          courtId: 0,
                          instructor:
                              reservationFormProvider.reservation.instructor));
                    }
                  : null,
              color: ColorConstant.green82,
              child: Text(
                TagConstant.reserve,
                style: AppStyle.txtPoppinsSemiBold18White,
              ))
        ],
      ),
    );
  }
}
