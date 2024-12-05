import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import '../../../shared/widgets/widgets.dart';

import '../../../core/shared_preferences/preferences.dart';

import 'package:court_reservation/core/models/court.dart';

import '../../../core/constants/color.constant.dart';

class CourtList extends StatelessWidget {
  const CourtList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<Court>, Court>(
      future: Preferences.getCourtList(),
      onLoaded: (court, index) {
        return Container(
          padding: const EdgeInsets.only(
              left: 18.25, top: 14, bottom: 14, right: 15.75),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorConstant.whiteEE),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _CardScheduledReservationtImage(
                image: 'assets/images/${court.image}.png',
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CourtBody(
                  court: court,
                ),
              )
            ],
          ),
        );
      },
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
