import 'package:court_reservation/screens/checkAuth/check_auth.dart';
import 'package:flutter/material.dart';

import 'package:court_reservation/layouts/dashboard.dart';
import 'package:court_reservation/screens/screens.dart';

class RouterApp {
  static const String initialRoute = CheckAuthScreen.route;

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(
      {
        LoginScreen.route: (BuildContext context) => const LoginScreen(),
        RegisterScreen.route: (BuildContext context) => const RegisterScreen(),
        FavoriteListScreen.route: (BuildContext context) =>
            const FavoriteListScreen(),
        WelcomeScreen.route: (BuildContext context) => const WelcomeScreen(),
        HomeScreen.route: (BuildContext context) => const LoginScreen(),
        CreateReservationScreen.route: (BuildContext context) =>
            CreateReservationScreen(),
        MainScreen.route: (BuildContext context) => const MainScreen(),
        ReservationListScreen.route: (BuildContext context) =>
            const ReservationListScreen(),
        CheckAuthScreen.route: (BuildContext context) =>
            const CheckAuthScreen(),
      },
    );

    return routes;
  }

  // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //   return RouterMain.onGenerateRoute(settings);
  // }
}
