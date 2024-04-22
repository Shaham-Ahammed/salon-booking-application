import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  shopName(BuildContext context) {
   return myFont("HIPOCHI SALON",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.028, context),
        fontWeight: FontWeight.w600,
        fontColor: greyColor);
  }