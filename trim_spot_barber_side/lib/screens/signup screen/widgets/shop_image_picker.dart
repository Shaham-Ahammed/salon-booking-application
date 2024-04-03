import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';
import 'package:dotted_border/dotted_border.dart';

class ShopImagePicker extends StatelessWidget {
  const ShopImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaqueryHeight(0.32, context),
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cyanColor, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 3,
          ),
          myFont(
              "This image will be seen by clients as a reference to your shop",
              fontFamily: balooChettan,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontColor: greyColor2),
          const SizedBox(
            height: 7,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DottedBorder(
                    color: cyanColor,
                    child: Center(
                      child: Icon(
                        Icons.store,
                        size: 35,
                        color: greyColor,
                      ),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}