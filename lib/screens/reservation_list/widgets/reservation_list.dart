import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:court_reservation/core/utils/format_time.dart';

import '../../../shared/services/court_service.dart';
import '../../../shared/widgets/widgets.dart';

import '../../../shared/providers/providers.dart';

import '../../../core/models/court.dart';
import '../../../core/models/reservation.dart';

import '../../../core/constants/color.constant.dart';

class ReservationList extends StatefulWidget {
  final Function(Reservation reservation) onDismissble;

  const ReservationList({Key? key, required this.onDismissble})
      : super(key: key);

  @override
  State<ReservationList> createState() => _ReservationListState();
}

class _ReservationListState extends State<ReservationList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ReservationProvider reservationProvider =
          Provider.of<ReservationProvider>(context, listen: false);

      await reservationProvider.getReservationList();
    });
  }

  @override
  Widget build(BuildContext context) {
    ReservationProvider reservationProvider =
        Provider.of<ReservationProvider>(context, listen: true);

    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (_, index) {
        Reservation reservation = reservationProvider.reservationList[index];
        Court court = CourtService.getCourtById(reservation.courtId);

        return Dismissible(
          confirmDismiss: (DismissDirection dismissDirection) async {
            return await widget.onDismissble(reservation);
          },
          key: ValueKey<int>(index),
          child: Container(
            padding: const EdgeInsets.only(
                left: 18.25, top: 14, bottom: 14, right: 15.75),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorConstant.whiteEE),
            ),
            child: ReservationItem(
              courtName: court.courtName,
              image: court.image,
              courtype: court.type,
              rainy: court.rainy,
              scheduleDate: reservation.reservationDate,
              reservedBy: reservation.reserveBy,
              quantityHour:
                  formatTime(reservation.timeInit, reservation.timeEnd),
              cost: court.cost,
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: reservationProvider.reservationList.length,
    );
  }
}
