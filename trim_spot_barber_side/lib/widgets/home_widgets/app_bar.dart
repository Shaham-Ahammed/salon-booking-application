import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/logo.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class AppBarHomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHeight(0.2, context),
      decoration: BoxDecoration(color: appBarColor),
      child: Column(
        children: [
          SizedBox(height: mediaqueryHeight(0.06, context)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.05, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                  scale: 1.25,
                  child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/s2.jpg"),
                      )),
                ),
                AppLogo(
                  size: mediaqueryHeight(0.045, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}