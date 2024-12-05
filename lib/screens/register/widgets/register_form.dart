import 'package:court_reservation/core/utils/validate_form.dart';
import 'package:court_reservation/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import '../../screens.dart';
import '../../../shared/widgets/widgets.dart';

import '../../../shared/providers/register_form_provider.dart';

import '../../../core/themes/app.styles.dart';

import '../../../core/constants/color.constant.dart';
import '../../../core/constants/tag.constant.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterFormProvider registerFormProvider =
        Provider.of<RegisterFormProvider>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: registerFormProvider.formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Nombre y apellido',
            prefixIcon: 'person_icon',
            validator: (value) {
              if (!hasNameMinimumLength(value)) {
                return 'Debe tener al menos 2 carácteres';
              }

              return null;
            },
            onChange: (value) => registerFormProvider.fullname = value ?? '',
          ),
          const SizedBox(height: 37),
          CustomTextField(
            label: 'email',
            prefixIcon: 'mail_icon',
            validator: (value) {
              if (!isValidEmail(value)) {
                return 'El correo ingresado no es válido';
              }

              return null;
            },
            onChange: (value) => registerFormProvider.email = value ?? '',
          ),
          const SizedBox(height: 37),
          CustomTextField(
            label: 'Teléfono',
            prefixIcon: 'phone_icon',
            onChange: (value) => registerFormProvider.phone = value ?? '',
          ),
          const SizedBox(height: 37),
          CustomTextField(
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
            onChange: (value) => registerFormProvider.password = value ?? '',
          ),
          const SizedBox(height: 37),
          CustomTextField(
            label: 'confirmar contraseña',
            prefixIcon: 'lock_icon',
            suffixIcon: Icons.visibility_outlined,
            obscureText: true,
            validator: (value) {
              if (!hasPasswordMinimumLength(value)) {
                return 'La contraseña debe de ser de 6 carácteres';
              }

              if (!isMatchPassword(registerFormProvider.password, value)) {
                return 'Las constraseña no coinciden';
              }

              return null;
            },
            onChange: (value) =>
                registerFormProvider.confirmPassword = value ?? '',
          ),
          const SizedBox(height: 40),
          CustomElevatedButton(
            variant: ButtonVariant.Solid,
            onTap: () => Navigator.pushNamed(context, LoginScreen.route),
            color: ColorConstant.green82,
            child: Text(
              TagConstant.register,
              style: AppStyle.txtPoppinsSemiBold18White,
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 38),
              child: _NotAccountRegister()),
        ],
      ),
    );
  }
}

class _NotAccountRegister extends StatelessWidget {
  const _NotAccountRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: TagConstant.accountYet,
          style: AppStyle.txtPoppinsRegular14Black),
      TextSpan(
          text: ' ${TagConstant.sigIn}',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(context, LoginScreen.route);
              // Single tapped.
            },
          style: AppStyle.txtPoppinsRegular14Blue)
    ]));
  }
}
