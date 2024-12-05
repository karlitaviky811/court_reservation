import 'package:court_reservation/core/constants/tag.constant.dart';
import 'package:court_reservation/main.dart';
import 'package:court_reservation/screens/login/login_screen.dart';
import 'package:court_reservation/screens/screens.dart';
import 'package:court_reservation/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// final fakeApp = MultiProvider(
//   providers: [
//     ChangeNotifierProvider(create: (_) => AuthProvider()),
//     ChangeNotifierProvider(create: (_) => LoginFormProvider()),
//   ],
//   child: MaterialApp(
//     home: LoginScreen(),
//   ),
// );
void main() {
  group('find all widgets on screen', () {
    testWidgets('find title', (widgetTester) async {
      // Arrenge

      await widgetTester.pumpWidget(const WelcomeScreen());

      const title = TagConstant.sigIn;

      // Act

      final findedTitle = find.text('hola mundo');

      // Assert
      expect(findedTitle, findsOneWidget);
    });
  });
}
