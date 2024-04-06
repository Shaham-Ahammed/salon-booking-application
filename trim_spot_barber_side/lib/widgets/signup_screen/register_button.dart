import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/signup_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/cyan_container.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: cyanColor,
        borderRadius: BorderRadius.circular(90),
        child: InkWell(
          splashFactory: InkSplash.splashFactory,
          onTap: () {
            if (registrationFormValidation.currentState!.validate()) {
            } else {
              return;
            }
          },
          borderRadius: BorderRadius.circular(90),
          child: Container(
            width: mediaqueryWidth(0.6, context),
            height: mediaqueryHeight(0.06, context),
            decoration: cyanContainer(transparentColor),
            child: Center(
              child: myFont("Register",
                  fontFamily: balooChettan,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontColor: blackColor),
            ),
          ),
        ));
  }
}
