import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';


class LocationPicker extends StatelessWidget {
  const LocationPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: greyColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          height: mediaqueryHeight(0.06, context),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.045, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myFont("Shop Location",
                    fontFamily: balooChettan,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.black54),
                Icon(
                  Icons.location_pin,
                  color: Colors.red.shade800,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

