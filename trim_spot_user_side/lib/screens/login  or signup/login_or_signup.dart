import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/spalsh user.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          loginPageButtons(
              context: context,
              left: 0.07,
              text: "LOGIN",
              textColor: blackColor,
              containerColor: cyanColor,
              borderColor: cyanColor),
          loginPageButtons(
              context: context,
              left: 0.53,
              text: "SIGNUP",
              textColor: whiteColor,
              containerColor: transparentColor,
              borderColor: whiteColor)
        ],
      ),
    );
  }
}

loginPageButtons(
    {required context,
    required double left,
    required String text,
    required Color textColor,
    required Color containerColor,
    required Color borderColor}) {
  return Positioned(
    bottom: mediaqueryHeight(0.07, context),
    left: mediaqueryWidth(left, context),
    child: Container(
      width: mediaqueryWidth(0.42, context),
      height: mediaqueryHeight(0.07, context),
      child: Center(
        child: myFont(text,
            fontFamily: cabinCondensed,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textalign: TextAlign.center,
            fontColor: textColor),
      ),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(90),
          border: Border.all(color: borderColor)),
    ),
  );
}
