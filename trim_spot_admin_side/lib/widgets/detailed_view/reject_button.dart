import 'package:flutter/material.dart';

import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';

class RejectButton extends StatelessWidget {
  const RejectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: redErrorColor,
      child: InkWell(
        hoverColor: Colors.red.shade400,
        borderRadius: BorderRadius.circular(90),
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            height: mediaqueryHeight(0.07, context),
            width: mediaqueryWidth(0.2, context),
            child: Center(
              child: myFont("Reject",
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.025, context),
                  fontWeight: FontWeight.w600,
                  fontColor: whiteColor),
            )),
      ),
    );
  }
}