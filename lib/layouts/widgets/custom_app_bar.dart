import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:court_reservation/screens/screens.dart';

import 'package:court_reservation/shared/widgets/custom_icon.dart';

import '../../shared/services/auth_service.dart';

import '../../core/models/user_model.dart';

import '../../core/themes/app.styles.dart';
import '../../core/constants/color.constant.dart';
import 'package:court_reservation/core/constants/tag.constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.elevation = 2.0,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;

  String getProfileImage(User? user) {
    return user != null ? user.image : 'profile';
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User? user = authProvider.user;

    return Material(
      elevation: elevation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            stops: [
              0.1,
              0.4,
              1.0,
            ],
            colors: [
              Color(0XFF06274D),
              Color(0XFF2C523A),
              Color(0XFF6DA415),
            ],
          ),
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          leading: leading,
          elevation: 0.0,
          toolbarHeight: 64,
          title: Container(
            padding: const EdgeInsets.only(left: 24),
            width: 124,
            height: 25,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo_header.png'),
                    fit: BoxFit.fill)),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${getProfileImage(user)}.png')),
                  borderRadius: BorderRadius.circular(50)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: CustomIcon(
                icon: 'notification_icon',
                size: 20,
                color: ColorConstant.whiteFF,
              ),
            ),
            PopupMenuButton<int>(
                icon: CustomIcon(
                  icon: 'menu_icon',
                  size: 14,
                  color: ColorConstant.whiteFF,
                ),
                color: ColorConstant.whiteFF,
                constraints: const BoxConstraints(minWidth: 100),
                offset: const Offset(40, 40),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () async {
                          await authProvider.logout();
                          Navigator.pushReplacementNamed(
                              context, WelcomeScreen.route);
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  color: ColorConstant.gray3D,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  TagConstant.signOut,
                                  style: AppStyle.txtPoppinsRegular12Black,
                                ),
                              ],
                            )),
                      ),
                    ]),
            const SizedBox(width: 14.23),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
