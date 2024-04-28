import 'package:flutter/material.dart';

import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
class ApproveButton extends StatelessWidget {
  const ApproveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: cyanColor,
      child: InkWell(
        hoverColor: Colors.green.shade400,
        borderRadius: BorderRadius.circular(90),
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            height: mediaqueryHeight(0.07, context),
            width: mediaqueryWidth(0.2, context),
            child: Center(
              child: myFont("Approve",
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.025, context),
                  fontWeight: FontWeight.w600,
                  fontColor: blackColor),
            )),
      ),
    );
  }
}