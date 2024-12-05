import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _fullname = '';

  String _email = '';

  String _phone = '';

  String _password = '';

  String _confirmPassword = '';

  String get fullname => _fullname;

  String get email => _email;

  String get phone => _phone;

  String get password => _password;

  String get confirmPassword => _confirmPassword;

  set fullname(String value) {
    _fullname = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  bool isValidform() {
    return formKey.currentState?.validate() ?? false;
  }
}
