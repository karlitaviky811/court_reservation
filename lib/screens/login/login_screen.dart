import 'package:court_reservation/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/tag.constant.dart';
import '../../shared/widgets/widgets.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login-route';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SecurityWrapper(
              title: TagConstant.sigIn,
              child: ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  child: const LoginForm()),
            ),
          ],
        ),
      ),
    );
  }
}
