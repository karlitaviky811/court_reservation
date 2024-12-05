import 'package:flutter/material.dart';
import 'package:court_reservation/core/models/user_model.dart';
import 'package:court_reservation/core/shared_preferences/preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? login(Map<String, dynamic> credentials) {
    print('credentials: $credentials');
    if (credentials['email'] == 'usuario@email.com' &&
        credentials['password'] == '123456') {
      _user = User(
          firstname: 'Andrea',
          lastname: 'Gómez',
          email: credentials['email'],
          image: 'profile',
          token: 'xxxxxxxx');

      return _user;
    }

    return null;
  }

  User? get user => _user;

  Future<void> logout() async {
    await Preferences.clearUser();
  }

  Future<bool> isAuthenticated() async {
    User? user = await Preferences.getUser();

    return user != null;
  }

  Future<User?> getCurrentUser() async {
    return await Preferences.getUser();
  }

  set user(User? user) {
    print('user: $user');
    _user = user;
  }
}
