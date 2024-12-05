import 'package:court_reservation/core/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/widgets.dart';
import '../shared/widgets/widgets.dart';

import '../shared/providers/providers.dart';

import 'package:court_reservation/core/models/bottom_navagation_menu.dart';

import '../screens/screens.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main-route';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final CourtProvider courtProvider =
          Provider.of<CourtProvider>(context, listen: false);
      await courtProvider.fetchCourt();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationMenu> defaultBottomMenuList = [
      const BottomNavigationMenu(
        icon: 'home_icon',
        title: 'Inicio',
      ),
      const BottomNavigationMenu(
        icon: 'calendar_icon',
        title: 'Reservas',
      ),
      const BottomNavigationMenu(
        icon: 'fav_icon',
        title: 'Favoritos',
      ),
    ];

    // Preferences.clearAll();

    final NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
            child: PageView(
          controller: navigationProvider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            ReservationListScreen(),
            FavoriteListScreen(),
          ],
        )),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: navigationProvider.currentIndex,
          onChangeIndex: (index) {
            navigationProvider.setNavigation(index);
          },
          bottomMenuList: defaultBottomMenuList,
        ));
  }
}
