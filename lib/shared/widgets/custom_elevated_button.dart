import 'package:flutter/material.dart';

import '../../core/constants/color.constant.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Widget child;
  final ButtonVariant? variant;

  const CustomElevatedButton({
    super.key,
    required this.color,
    this.onTap,
    this.height,
    required this.child,
    this.width,
    this.variant,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 53,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: ColorConstant.green82.withOpacity(0.3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), side: _setBorder()),
            backgroundColor: _setColor(),
          ),
          onPressed: onTap,
          child: child),
    );
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.Solid:
        return color;
      case ButtonVariant.Outline:
        return ColorConstant.whiteFF;
      default:
        return null;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.Outline:
        return BorderSide(
          color: color,
          width: 1.0,
        );

      default:
        return BorderSide.none;
    }
  }
}

enum ButtonVariant { Outline, Solid }
