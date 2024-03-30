
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

class OrSeperator extends StatelessWidget {
  const OrSeperator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: mediaqueryWidth(0.05, context),
        ),
        Container(
          color: Colors.white30,
          height: 1,
          width: mediaqueryWidth(0.3, context),
        ),
        SizedBox(
          width: mediaqueryWidth(0.04, context),
        ),
        myFont("or",
            fontFamily: balooChettan,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontColor: greyColor2),
        SizedBox(
          width: mediaqueryWidth(0.04, context),
        ),
        Container(
          color: Colors.white30,
          height: 01,
          width: mediaqueryWidth(0.3, context),
        ),
      ],
    );
  }
}