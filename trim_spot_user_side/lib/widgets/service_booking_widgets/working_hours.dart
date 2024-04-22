import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';
  Container workingHourContainerField(BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaqueryHeight(0.06, context),
      decoration: BoxDecoration(
          color: greyColor3,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyColor, width: .4)),
      padding: containerPaddingServiceBooking(context),
      child: Align(
        alignment: Alignment.centerLeft,
        child: myFont("09:00 AM - 08:00 PM",
            fontFamily: cabinCondensed,
            textalign: TextAlign.start,
            fontSize: mediaqueryHeight(0.02, context),
            fontWeight: FontWeight.normal,
            fontColor: whiteColor),
      ),
    );
  }