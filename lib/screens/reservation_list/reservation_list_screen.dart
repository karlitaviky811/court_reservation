import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:court_reservation/screens/reservation_list/widgets/widgets.dart';

import 'package:court_reservation/shared/providers/providers.dart';

import '../../../core/models/reservation.dart';

import '../../../core/shared_preferences/preferences.dart';

import '../../core/themes/app.styles.dart';
import '../../../core/constants/color.constant.dart';
import '../../core/constants/tag.constant.dart';

class ReservationListScreen extends StatelessWidget {
  static const String route = 'reservations-route';
  const ReservationListScreen({Key? key}) : super(key: key);

  Future<bool> displayDialogAndroid(
      BuildContext context, Reservation reservation) async {
    bool isClose = false;
    if (Platform.isAndroid) {
      await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ColorConstant.whiteFF,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              elevation: 5,
              title: Text(TagConstant.removeReservation,
                  style: AppStyle.txtPoppinsSemiBold18Black),
              actions: [
                TextButton(
                    onPressed: () {
                      isClose = false;
                      Navigator.pop(context);
                    },
                    child: Text(TagConstant.cancel,
                        style: AppStyle.txtPoppinsRegular14Black)),
                TextButton(
                    onPressed: () async {
                      // Preferences.removeReservation(reservation);
                      ReservationProvider reservationProvider =
                          Provider.of<ReservationProvider>(context,
                              listen: false);
                      reservationProvider.removeReservation(reservation);

                      isClose = true;
                      Navigator.pop(context);
                    },
                    child: Text(TagConstant.accept,
                        style: AppStyle.txtPoppinsRegular14Black)),
              ],
            );
          });
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text(TagConstant.removeReservation),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Preferences.removeReservation(reservation);
                isClose = true;
                Navigator.pop(context);
              },
              child: Text(TagConstant.accept,
                  style: AppStyle.txtPoppinsRegular14Black),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context),
              child: Text(TagConstant.cancel,
                  style: AppStyle.txtPoppinsRegular14Black),
            ),
          ],
        ),
      );
    }

    return isClose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 41, bottom: 32),
                child: ButtonScheduleReservation(onTap: () {
                  NavigationProvider navigationProvider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  navigationProvider.setNavigation(0);
                })),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TagConstant.myReservataion,
                    style: AppStyle.txtPoppinsMedium18Black,
                  ),
                  const SizedBox(height: 16),
                  ReservationList(
                      onDismissble: (Reservation reservation) async {
                    bool isClose =
                        await displayDialogAndroid(context, reservation);
                    return Future.sync(() => isClose);
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
