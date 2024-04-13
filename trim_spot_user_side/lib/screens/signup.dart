import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/textformfields.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/register_button.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/sizedbox.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/welcome.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            padding: screenPadding(context),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryHeight(0.04, context),
                ),
                welcomeText(),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Image.asset(scale: 1.6, "assets/images/profile upload.png"),
                SizedBox(
                  height: mediaqueryHeight(0.03, context),
                ),
                TextFormFieldCyan(
                  hintText: "Name",
                  textInputType: TextInputType.name,
                  filteringTextInputFormatter:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Phone",
                  textInputType: TextInputType.number,
                  maxLenght: 10,
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Password",
                  obscureText: true,
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: mediaqueryHeight(0.04, context),
                ),
                const RegisterButton(),
                SizedBox(height: mediaqueryHeight(0.06, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
