import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:court_reservation/layouts/dashboard.dart';
import 'package:court_reservation/screens/screens.dart';

import 'package:court_reservation/shared/providers/providers.dart';

import 'package:court_reservation/core/constants/tag.constant.dart';

class CheckAuthScreen extends StatelessWidget {
  static const String route = 'check-route';

  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
            future: authProvider.isAuthenticated(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data) {
                  Future.microtask(() => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const MainScreen())));
                } else {
                  Future.microtask(() => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const WelcomeScreen())));
                }
              }

              return const SizedBox(
                child: Text(TagConstant.loading),
              );
            }));
  }
}
