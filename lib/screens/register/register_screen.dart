import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/widgets.dart';
import 'widgets/widgets.dart';

import '../../shared/providers/register_form_provider.dart';

import 'package:court_reservation/core/constants/tag.constant.dart';

class RegisterScreen extends StatelessWidget {
  static const String route = 'register-route';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SecurityWrapper(
            title: TagConstant.registration,
            child: ChangeNotifierProvider(
                create: (_) => RegisterFormProvider(),
                child: const RegisterForm()),
          ),
        ],
      ),
    ));
  }
}
