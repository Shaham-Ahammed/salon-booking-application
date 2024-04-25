import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

resendEmailText(context) {
  return myFont("click the button below to resend email.",
      fontFamily: balooChettan,
      textalign: TextAlign.center,
      fontSize: mediaqueryHeight(0.015, context),
      fontWeight: FontWeight.w500,
      fontColor: whiteColor);
}

emailSendedText(BuildContext context) {
  return myFont(
      "Almost there! We've sent a verification link to your registered email address.Click the link to complete the verification process.To proceed, please click the button below after verifying your email",
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.02, context),
      fontWeight: FontWeight.w700,
      fontColor: whiteColor);
}

pageTitle(BuildContext context) {
  return myFont("Email Verification",
      fontFamily: cabinCondensed,
      fontSize: mediaqueryHeight(0.04, context),
      fontWeight: FontWeight.w600,
      fontColor: whiteColor);
}
