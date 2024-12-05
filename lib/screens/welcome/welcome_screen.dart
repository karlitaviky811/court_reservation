import 'package:flutter/material.dart';

import '../register/register_screen.dart';
import '../login/login_screen.dart';

import '../../shared/widgets/widgets.dart';

import '../../core/constants/color.constant.dart';
import '../../core/constants/tag.constant.dart';
import '../../core/themes/app.styles.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = 'welcome-route';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/group20.png"),
                fit: BoxFit.cover),
          ),
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 90,
                    left: 83,
                    child: Container(
                      width: 209,
                      height: 148,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.cover),
                      ),
                      child: null,
                    ),
                  ),
                  const Positioned(
                    bottom: 51,
                    left: 32,
                    right: 32,
                    child: ContainerButtons(),
                  )
                ],
              ))),
    );
  }
}

class ContainerButtons extends StatelessWidget {
  const ContainerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SizedBox(
        width: width,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomElevatedButton(
              variant: ButtonVariant.Solid,
              onTap: () => Navigator.pushNamed(context, LoginScreen.route),
              color: ColorConstant.green82,
              child: Text(
                TagConstant.sigIn,
                style: AppStyle.txtPoppinsSemiBold18White,
              ),
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              variant: ButtonVariant.Solid,
              onTap: () => Navigator.pushNamed(context, RegisterScreen.route),
              color: ColorConstant.whiteEC.withOpacity(0.2),
              child: Text(
                TagConstant.register,
                style: AppStyle.txtPoppinsSemiBold18White,
              ),
            ),
          ],
        ));
  }
}
