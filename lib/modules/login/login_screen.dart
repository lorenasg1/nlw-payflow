import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(children: [
            Container(
                width: screenSize.width,
                height: screenSize.height * 0.36,
                color: AppColors.primary),
            Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Image.asset(AppImages.person, width: 208, height: 253)),
            Positioned(
                bottom: screenSize.height * 0.04,
                left: 0,
                right: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logomini),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 70, right: 70),
                        child: Text('Organize seus boletos em um só lugar',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.titleHome),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 26, left: 40, right: 40),
                        child: SocialLoginButton(
                          onTap: () {
                            controller.googleSignIn(context);
                          },
                        ),
                      )
                    ]))
          ]),
        ));
  }
}
