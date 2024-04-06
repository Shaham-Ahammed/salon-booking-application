import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/login_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textformfields.dart';
import 'package:trim_spot_barber_side/widgets/login_screen/background_image.dart';
import 'package:trim_spot_barber_side/widgets/login_screen/google_signin.dart';
import 'package:trim_spot_barber_side/widgets/login_screen/login_button.dart';
import 'package:trim_spot_barber_side/widgets/login_screen/or_seperator.dart';
import 'package:trim_spot_barber_side/widgets/login_screen/resgister_text.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundImage(),
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: EdgeInsets.all(mediaqueryHeight(0.04, context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaqueryHeight(0.45, context),
                    ),
                    const GoogleSignIn(),
                    SizedBox(
                      height: mediaqueryHeight(0.01, context),
                    ),
                    const OrSeperator(),
                    SizedBox(
                      height: mediaqueryHeight(0.03, context),
                    ),
                     TextFormFieldCyan(
                      controller: loginEmailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.03, context),
                    ),
                     TextFormFieldCyan(
                      controller: loginPasswordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.04, context),
                    ),
                    const LoginButton(),
                    SizedBox(
                      height: mediaqueryHeight(0.04, context),
                    ),
                    const RegisterNowText()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
