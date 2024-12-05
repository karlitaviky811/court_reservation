import 'package:flutter/material.dart';

import '../../core/constants/color.constant.dart';

class CustomButtonBack extends StatelessWidget {
  final VoidCallback onTap;

  const CustomButtonBack({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: ColorConstant.green82,
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.arrow_back,
          color: ColorConstant.whiteFC,
        ),
      ),
    );
  }
}
