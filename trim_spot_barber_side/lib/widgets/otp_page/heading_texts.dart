import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

checkMobileSms() {
 return myFont("please check your phone sms",
      fontFamily: balooChettan,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontColor: whiteColor);
}

fourDigitCodeTitle(BuildContext context) {
 return myFont("Enter your 4 digit code",
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.032, context),
      fontWeight: FontWeight.w700,
      fontColor: whiteColor);
}

pageTitle(BuildContext context) {
 return myFont("OTP Verification",
      fontFamily: cabinCondensed,
      fontSize: mediaqueryHeight(0.04, context),
      fontWeight: FontWeight.w600,
      fontColor: whiteColor);
}
