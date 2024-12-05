import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int _currentIndex = 0;

  PageController get pageController => _pageController;

  int get currentIndex => _currentIndex;

  setNavigation(int index) {
    setCurrentBottomNavigation(index);
    setCurrentPage(index);
    notifyListeners();
  }

  setCurrentBottomNavigation(int index) {
    _currentIndex = index;
  }

  setCurrentPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }
}
