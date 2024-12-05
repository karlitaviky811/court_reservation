import 'package:flutter/material.dart';

import '../../core/constants/color.constant.dart';
import '../../core/themes/app.styles.dart';

class CustomDatePickerField extends StatelessWidget {
  final String label;
  final String value;
  final String placeholder;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  const CustomDatePickerField(
      {Key? key,
      required this.label,
      required this.value,
      required this.placeholder,
      required this.onTap,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.whiteFF,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: ColorConstant.whiteEE, width: 1.0)),
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
              contentPadding: padding,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabled: true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppStyle.txtRobotoRegular12Black,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value != '' ? value : placeholder,
                          style: value != ''
                              ? AppStyle.txtRobotoRegular14Blue
                              : AppStyle.txtRobotoRegular14Gray,
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined,
                            color: ColorConstant.gray3D),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
