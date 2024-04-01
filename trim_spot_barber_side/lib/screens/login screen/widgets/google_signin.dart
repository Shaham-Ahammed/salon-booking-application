

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';


class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: greyColor2,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {},
        child: Container(
          height: mediaqueryHeight(0.06, context),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/mdi--google.svg"),
              SizedBox(
                width: mediaqueryWidth(0.04, context),
              ),
              myFont("Sign in with google",
                  fontFamily: balooChettan,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontColor: blackColor)
            ],
          ),
        ),
      ),
    );
  }
}