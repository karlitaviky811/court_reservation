import 'package:court_reservation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color.constant.dart';
import '../../core/models/bottom_navagation_menu.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onChangeIndex;
  final List<BottomNavigationMenu> bottomMenuList;
  final int currentIndex;
  final Color? backgroundColor;

  const CustomBottomNavigationBar(
      {Key? key,
      required this.onChangeIndex,
      required this.bottomMenuList,
      required this.currentIndex,
      this.backgroundColor})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: widget.onChangeIndex,
        currentIndex: widget.currentIndex,
        items: List.generate(widget.bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
              label: '',
              icon: Container(
                decoration: BoxDecoration(
                    color: widget.currentIndex == index
                        ? ColorConstant.green82
                        : null,
                    borderRadius: BorderRadius.circular(13)),
                width: 70,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: widget.bottomMenuList[index].icon,
                      size: 26,
                    ),
                    Text(widget.bottomMenuList[index].title ?? '')
                  ],
                ),
              ));
        }).toList());
  }
}
