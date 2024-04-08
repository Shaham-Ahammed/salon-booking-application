// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/otp_verification.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';
import 'package:trim_spot_barber_side/utils/registration_page/cyan_container.dart';
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
          onTap: () {
            Navigator.of(context)
                .push(NoTransitionPageRoute(child: OtpVerificationScreen()));
            // registerButtonPressed.value = true;
            // registerButtonPressed.notifyListeners();
            if (detailsSubmitted(context)) {
              print("success");
            } else {
              print("failure");
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
