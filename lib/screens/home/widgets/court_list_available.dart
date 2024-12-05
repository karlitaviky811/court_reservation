import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/widgets.dart';

import '../../../shared/providers/court_provider.dart';

import '../../../core/models/court.dart';

import '../../../core/constants/color.constant.dart';
import '../../../core/themes/app.styles.dart';

class CourtListAvailable extends StatelessWidget {
  final Function(Court) onTap;
  const CourtListAvailable({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final CourtProvider courtProvider = Provider.of<CourtProvider>(context);

    return SizedBox(
        width: double.infinity,
        height: 360,
        child: ListView.separated(
          padding: const EdgeInsets.only(right: 23),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final court = courtProvider.courtList[index];
            return _CardPreviewCourt(
              court: court,
              onTap: () => onTap(court),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(width: 20),
          itemCount: courtProvider.courtList.length,
        ));
  }
}

class _CardPreviewCourt extends StatelessWidget {
  final Court court;
  final VoidCallback? onTap;

  const _CardPreviewCourt({
    super.key,
    required this.court,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.whiteEE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _CardPrevieCourtImage(image: court.image),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.25, vertical: 12),
          child: Column(
            children: [
              CourtBody(court: court),
              const SizedBox(height: 40),
              CustomElevatedButton(
                  variant: ButtonVariant.Solid,
                  height: 32,
                  onTap: onTap,
                  color: ColorConstant.green82,
                  child: Text(
                    'Reservar',
                    style: AppStyle.txtPoppinsRegular14White,
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

class _CardPrevieCourtImage extends StatelessWidget {
  const _CardPrevieCourtImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 137,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConstant.whiteEE),
          image: DecorationImage(
              image: AssetImage('assets/images/$image.png'),
              fit: BoxFit.cover)),
    );
  }
}
