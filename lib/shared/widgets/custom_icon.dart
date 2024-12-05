import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;

  const CustomIcon({super.key, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
        size: size ?? 13,
        color: color,
        icon: SvgIconData('assets/icons/$icon.svg'));
  }
}
