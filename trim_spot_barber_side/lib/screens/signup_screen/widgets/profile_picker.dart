import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';
import 'package:dotted_border/dotted_border.dart';

class ProfilePicker extends StatelessWidget {
  const ProfilePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: mediaqueryHeight(0.25, context),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(14),
                bottomRight: Radius.circular(14)),
            border: Border.all(color: cyanColor, width: 2)),
        child: Column(
          children: [
            SizedBox(
              height: mediaqueryHeight(0.015, context),
            ),
            myFont("Profile",
                fontFamily: balooChettan,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontColor: greyColor2),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: mediaqueryHeight(0.02, context),
                    right: mediaqueryHeight(0.02, context),
                    bottom: mediaqueryHeight(0.04, context)),
                child: SizedBox(
                  width: double.infinity,
                  child: DottedBorder(
                      color: cyanColor,
                      child: Center(
                        child: Icon(
                          Icons.person_outline,
                          color: greyColor,
                          size: 30,
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

