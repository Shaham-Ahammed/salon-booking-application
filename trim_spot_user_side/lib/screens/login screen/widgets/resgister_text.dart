
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';

class RegisterNowText extends StatelessWidget {
  const RegisterNowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myFont("Don't have an account ? ",
            fontFamily: balooChettan,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontColor: whiteColor),
        myFont("Register Now",
            fontFamily: balooChettan,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontColor: cyanColor),
      ],
    );
  }
}