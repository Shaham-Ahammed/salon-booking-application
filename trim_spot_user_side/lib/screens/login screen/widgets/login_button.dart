
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/cyan_container.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cyanColor,
      borderRadius: BorderRadius.circular(90),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(90),
        child: Container(
          decoration: cyanContainer(transparentColor),
          width: mediaqueryWidth(0.45, context),
          height: mediaqueryHeight(0.06, context),
          child: Center(
            child: myFont("Login",
                fontFamily: balooChettan,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontColor: blackColor),
          ),
        ),
      ),
    );
  }
}