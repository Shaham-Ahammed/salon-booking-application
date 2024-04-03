import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/background_image.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/google_signin.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/login_button.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/or_seperator.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/resgister_text.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/textformfields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                  const TextFormFieldCyan(
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  const TextFormFieldCyan(
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
    );
  }
}
