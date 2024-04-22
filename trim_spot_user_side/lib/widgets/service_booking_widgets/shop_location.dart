import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';


class ShopLocation extends StatelessWidget {
  const ShopLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          color: greyColor,
          size: mediaqueryHeight(0.022, context),
        ),
        myFont(" Mattanjeri",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.022, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor)
      ],
    );
  }
}