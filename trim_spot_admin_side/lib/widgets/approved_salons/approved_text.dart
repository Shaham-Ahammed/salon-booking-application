import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:flutter/material.dart';
class ApprovedSalonText extends StatelessWidget {
  const ApprovedSalonText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: myFont("Approved salons - 9",
            fontFamily: b612,
            textalign: TextAlign.center,
            fontSize: mediaqueryHeight(0.025, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor2));
  }
}
