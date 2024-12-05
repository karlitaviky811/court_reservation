import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/models/user_model.dart';
import 'widgets/widgets.dart';

import 'package:court_reservation/shared/providers/favorite_provider.dart';
import '../../shared/providers/providers.dart';

import '../../../core/models/reservation.dart';
import 'package:court_reservation/core/models/court.dart';

import 'package:court_reservation/core/shared_preferences/preferences.dart';

class CreateReservationScreen extends StatelessWidget {
  static const String route = 'reservation-route';

  CreateReservationScreen({Key? key}) : super(key: key);

  bool showSummary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ReservationFormProvider(),
        child: const CreateReservationBodyScreen(),
      ),
    );
  }
}

class CreateReservationBodyScreen extends StatelessWidget {
  const CreateReservationBodyScreen({Key? key}) : super(key: key);

  void handleSaveFavorite(
      FavoriteProvider favoriteProvider, Court selectedCourt) async {
    List<Court> courtList = await Preferences.getCourtList();

    bool isFavorite = await Preferences.belongToFavorite(selectedCourt);

    if (isFavorite) {
      courtList.add(selectedCourt);
      await Preferences.saveFavoriteCourt(courtList);
    } else {
      await Preferences.removeCourt(selectedCourt);
    }

    favoriteProvider.setIsFavorite = isFavorite;
  }

  void handleSubmitForm(Reservation reservation, Court selectedCourt) async {
    List<Reservation> reservationList = await Preferences.getReservationList();
    User? user = await Preferences.getUser();

    reservation.id = DateTime.now().toString();
    reservation.courtId = selectedCourt.id;

    if (user != null) {
      reservation.reserveBy = '${user.firstname} ${user.lastname}';
    }

    reservationList.insertAll(0, [reservation]);

    await Preferences.saveReservationList(reservationList);
  }

  @override
  Widget build(BuildContext context) {
    Court selectedCourt = ModalRoute.of(context)?.settings.arguments as Court;

    FavoriteProvider favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);

    ReservationFormProvider reservationFormProvider =
        Provider.of<ReservationFormProvider>(context, listen: true);

    favoriteProvider.init(selectedCourt);

    List<String> carouselImagesPath = [
      selectedCourt.image,
      selectedCourt.image,
      selectedCourt.image,
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<FavoriteProvider>(
            builder: (context, value, child) => CarouselCourt(
              isFavorite: favoriteProvider.isFavorite,
              carouselImagesPath: carouselImagesPath,
              onFavorite: () {
                handleSaveFavorite(favoriteProvider, selectedCourt);
              },
            ),
          ),
          CourtDetail(
              court: selectedCourt,
              showDrowpdown: reservationFormProvider.progress != 'step3',
              instructor: reservationFormProvider.reservation.instructor,
              onChangeDrowpdown: reservationFormProvider.progress == 'step1'
                  ? (value) {
                      ReservationFormProvider reservationFormProvider =
                          Provider.of<ReservationFormProvider>(context,
                              listen: false);
                      reservationFormProvider.updateInstructor = value!;
                    }
                  : null),
          if (reservationFormProvider.progress == 'step1')
            ReservationForm(onTap: (Reservation reservation) {}),
          if (reservationFormProvider.progress == 'step2')
            SummaryReservationForm(onTap: () {}),
          if (reservationFormProvider.progress == 'step3')
            SummaryReservation(
                court: selectedCourt,
                reservation: reservationFormProvider.reservation),
          if (reservationFormProvider.progress == 'step3')
            PaymentReservation(
                court: selectedCourt,
                onPayment: () {
                  handleSubmitForm(
                      reservationFormProvider.reservation, selectedCourt);
                  NavigationProvider navigationProvider =
                      Provider.of<NavigationProvider>(context, listen: false);

                  navigationProvider.setNavigation(1);
                  Navigator.pop(context);
                },
                onCancel: () {
                  Navigator.pop(context);
                }),
          const SizedBox(height: 41)
        ],
      ),
    );
  }
}
