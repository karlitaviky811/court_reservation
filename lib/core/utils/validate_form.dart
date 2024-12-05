const nameMinimumLength = 2;

const passwordMinimumLength = 6;

bool isValidEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(pattern);

  return regExp.hasMatch(value ?? '');
}

bool hasNameMinimumLength(String? value) {
  return (value != null && value.length >= nameMinimumLength);
}

bool hasPasswordMinimumLength(value) {
  return (value != null && value.length >= passwordMinimumLength);
}

bool isMatchPassword(String password, String? confirmPassword) {
  return password == confirmPassword;
}
