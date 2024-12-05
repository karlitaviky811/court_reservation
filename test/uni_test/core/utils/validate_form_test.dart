import 'package:court_reservation/core/utils/validate_form.dart';
import 'package:flutter_test/flutter_test.dart';

const validPassword = '12345678';
const invalidPassword = '123';

const validName = 'Joe Doe';
const invalidName = 'J';

const validEmail = 'joe@email.com';
const invalidEmail = 'joe.co';

void main() {
  group('Password must have 8 characters', () {
    test('Password with 8 characteres will be valid', () {
      expect(hasPasswordMinimumLength(validPassword), true);
    });

    test('Password with less than 8 characteres will not be valid', () {
      expect(hasPasswordMinimumLength(invalidPassword), false);
    });
  });

  group('Name must have at least 2 characteres', () {
    test('Name with 2 or more will be valid', () {
      expect(hasNameMinimumLength(validName), true);
    });
    test('Name with less than 2 characters will be invalid', () {
      expect(hasNameMinimumLength(validName), false);
    });
  });

  group('Email must be in the correct format', () {
    test('Email with correct format will be valid', () {
      expect(isValidEmail(validEmail), true);
    });
    test('Email with incorrect format will not be valid', () {
      expect(isValidEmail(invalidEmail), false);
    });
  });

  group('Email must be in the correct format', () {
    test('Email with correct format will be valid', () {
      expect(isValidEmail(validEmail), true);
    });
    test('Email with incorrect format will not be valid', () {
      expect(isValidEmail(invalidEmail), false);
    });
  });

  group('Password confirmation must equal the password', () {
    test('Password confirmation equal to the password will be correct', () {
      expect(isMatchPassword(validPassword, '12345678'), true);
    });

    test('Password confirmation other than the password will be incorrect', () {
      expect(isMatchPassword(validPassword, '123456'), false);
    });
  });
}
