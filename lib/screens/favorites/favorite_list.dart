import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

import '../../core/themes/app.styles.dart';
import 'package:court_reservation/core/constants/tag.constant.dart';

class FavoriteListScreen extends StatelessWidget {
  static const String route = 'favorite-route';

  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 32, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TagConstant.myFavorites,
                    style: AppStyle.txtPoppinsMedium18Black,
                  ),
                  const SizedBox(height: 16),
                  const CourtList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
