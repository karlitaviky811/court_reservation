import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:court_reservation/shared/services/auth_service.dart';

import '../screens.dart';
import 'widgets/widgets.dart';

import '../../core/models/court.dart';
import '../../core/models/user_model.dart';
import 'package:court_reservation/core/models/reservation.dart';

import 'package:court_reservation/core/shared_preferences/preferences.dart';

import '../../core/themes/app.styles.dart';

import '../../core/constants/tag.constant.dart';
import '../../core/constants/color.constant.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home-route';
  const HomeScreen({Key? key}) : super(key: key);

  Future<bool> canReserve(Court selectedCourt) async {
    List<Reservation> reservationList = await Preferences.getReservationList();

    return reservationList
            .where((reservation) => reservation.courtId == selectedCourt.id)
            .length >=
        3;
  }

  Future<bool> displayDialog(BuildContext context) async {
    bool isClose = false;

    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorConstant.whiteFF,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            elevation: 5,
            title: Text(
                'Ha llegado al máximo de reservaciones para esta cancha',
                style: AppStyle.txtPoppinsSemiBold18Black),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text('Aceptar',
                      style: AppStyle.txtPoppinsRegular14Black)),
            ],
          );
        });

    return isClose;
  }

  String getFullname(User? user) {
    return user != null ? '${user.firstname} ${user.lastname}' : '';
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    User? user = authProvider.user;

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 23, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 31),
              child: Text('Hola ${getFullname(user)}!',
                  style: AppStyle.txtPoppinsSemiBold20Black),
            ),

            Text(
              TagConstant.courtTitle,
              style: AppStyle.txtPoppinsMedium18Black,
            ),

            // Court list
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 40),
              child: CourtListAvailable(
                onTap: (Court selectedCourt) async {
                  bool value = await canReserve(selectedCourt);
                  if (!value) {
                    Navigator.pushNamed(context, CreateReservationScreen.route,
                        arguments: selectedCourt);
                  } else {
                    displayDialog(context);
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 41),
              child: Text(
                TagConstant.scheduleReservationTitle,
                style: AppStyle.txtPoppinsMedium18Black,
              ),
            ),

            // Scheduled reservations
            const ScheduleReservationList(),
          ],
        ),
      ),
    ));
  }
}
