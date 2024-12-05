import 'package:court_reservation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color.constant.dart';
import '../../core/themes/app.styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String prefixIcon;
  final IconData? suffixIcon;
  final Function(String?)? onChange;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? value;

  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.onChange,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      initialValue: value,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.black3D, width: 1.0)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.gray9B, width: 1.0)),
          label: Text(label, style: AppStyle.txtPoppinsRegular14Black),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 10, minHeight: 5),
          prefixIcon: Container(
            width: 30,
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1.0, color: ColorConstant.black3D))),
              width: 24,
              height: 4,
              padding: const EdgeInsets.only(right: 8),
              child: CustomIcon(
                icon: prefixIcon,
                // size: 8,
              ),
            ),
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: ColorConstant.gray9B,
          )),
      validator: validator,
      onChanged: onChange,
    );
  }
}
