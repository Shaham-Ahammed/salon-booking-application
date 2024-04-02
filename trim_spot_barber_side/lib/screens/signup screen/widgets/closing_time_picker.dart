import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';

class ClosingTimePicker extends StatelessWidget {
  const ClosingTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.black54,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: cyanColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          height: mediaqueryHeight(0.07, context),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.045, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myFont("Closing Time",
                    fontFamily: balooChettan,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontColor: greyColor2),
                Icon(
                  Icons.schedule,
                  color: Colors.red.shade600,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



