import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';
import 'package:dotted_border/dotted_border.dart';
class ShopLicensePicker extends StatelessWidget {
  const ShopLicensePicker({
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
                topLeft: Radius.circular(14), bottomLeft: Radius.circular(14)),
            border: Border.all(color: cyanColor, width: 2)),
        child: Column(
          children: [
            SizedBox(
              height: mediaqueryHeight(0.015, context),
            ),
            myFont("Shop License",
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
                          Icons.document_scanner_outlined,
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
