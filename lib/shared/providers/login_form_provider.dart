import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email = '';

  String _password = '';

  bool _rememberPassword = false;

  String get email => _email;

  String get password => _password;

  bool get rememberPassword => _rememberPassword;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set rememberPassword(bool value) {
    _rememberPassword = value;
    notifyListeners();
  }

  bool isValidform() {
    return formKey.currentState?.validate() ?? false;
  }
}
