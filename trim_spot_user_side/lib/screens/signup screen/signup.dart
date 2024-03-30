import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';
import 'package:trim_spot_user_side/screens/login%20screen/widgets/background_image.dart';
import 'package:trim_spot_user_side/screens/login%20screen/widgets/textformfields.dart';
import 'package:trim_spot_user_side/screens/signup%20screen/widgets/register_button.dart';
import 'package:trim_spot_user_side/screens/signup%20screen/widgets/sizedbox.dart';

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
            padding: EdgeInsets.only(
                left: mediaqueryHeight(0.04, context),
                right: mediaqueryHeight(0.04, context),
                top: mediaqueryHeight(0.04, context),
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryHeight(0.04, context),
                ),
                myFont("welcome",
                    fontFamily: cabinCondensed,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    fontColor: whiteColor),
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


