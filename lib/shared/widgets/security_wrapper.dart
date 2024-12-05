import 'package:court_reservation/shared/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color.constant.dart';
import '../../core/themes/app.styles.dart';

class SecurityWrapper extends StatelessWidget {
  final Widget child;
  final String title;

  const SecurityWrapper({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(children: [
      Stack(
        children: [
          Container(
              width: width,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover),
              )),
          Positioned(
              top: 24,
              left: 32,
              child: CustomButtonBack(onTap: () => Navigator.pop(context)))
        ],
      ),
      const SizedBox(height: 40),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.txtPoppinsSemiBold24Black,
            ),
            const SizedBox(height: 5),
            Container(
              width: 80.0,
              height: 1.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: ColorConstant.blue34)),
            ),
            const SizedBox(height: 46),
            child
          ],
        ),
      )
    ]);
  }
}
