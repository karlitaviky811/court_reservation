import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import 'package:court_reservation/screens/screens.dart';
import '../../../core/models/user_model.dart';
import '../../../layouts/dashboard.dart';

import '../../../shared/widgets/widgets.dart';

import 'package:court_reservation/shared/providers/providers.dart';

import '../../../core/shared_preferences/preferences.dart';

import '../../../core/themes/app.styles.dart';

import 'package:court_reservation/core/utils/validate_form.dart';

import '../../../core/constants/color.constant.dart';
import 'package:court_reservation/core/constants/tag.constant.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginFormProvider loginFormProvider =
        Provider.of<LoginFormProvider>(context, listen: true);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: loginFormProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextField(
              key: const Key('input-email'),
              label: 'Email',
              prefixIcon: 'mail_icon',
              validator: (value) {
                if (!isValidEmail(value)) {
                  return 'El correo ingresado no es válido';
                }

                return null;
              },
              onChange: (value) => loginFormProvider.email = value ?? ''),
          const SizedBox(height: 26),
          CustomTextField(
            key: const Key('input-password'),
            label: 'contraseña',
            prefixIcon: 'lock_icon',
            suffixIcon: Icons.visibility_outlined,
            obscureText: true,
            validator: (value) {
              if (!hasPasswordMinimumLength(value)) {
                return 'La contraseña debe de ser de 6 carácteres';
              }

              return null;
            },
            onChange: (value) => loginFormProvider.password = value ?? '',
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            activeColor: ColorConstant.green82,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: loginFormProvider.rememberPassword,
            onChanged: (value) {
              loginFormProvider.rememberPassword = value ?? false;
            },
            title: Text(TagConstant.rememberPassword,
                style: AppStyle.txtPoppinsRegular12Black),
          ),
          Text(
            TagConstant.remenberPassword,
            style: AppStyle.txtPoppinsRegular14Blue,
          ),
          const SizedBox(height: 40),
          CustomElevatedButton(
            variant: ButtonVariant.Solid,
            onTap: () {
              Map<String, dynamic> credentials = {
                'email': loginFormProvider.email,
                'password': loginFormProvider.password,
                'rememberPassword': loginFormProvider.rememberPassword,
              };

              if (loginFormProvider.isValidform()) {
                User? response = authProvider.login(credentials);

                if (response != null) {
                  Preferences.saveUser(response);
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainScreen.route, (route) => false);
                }
              }
            },
            color: ColorConstant.green82,
            child: Text(
              TagConstant.sigIn,
              style: AppStyle.txtPoppinsSemiBold18White,
            ),
          ),
          const SizedBox(height: 64),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: TagConstant.notAccount,
                style: AppStyle.txtPoppinsRegular14Black),
            TextSpan(
                text: ' ${TagConstant.registerIt}',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RegisterScreen.route);
                    // Single tapped.
                  },
                style: AppStyle.txtPoppinsRegular14Blue)
          ]))
        ],
      ),
    );
  }
}
