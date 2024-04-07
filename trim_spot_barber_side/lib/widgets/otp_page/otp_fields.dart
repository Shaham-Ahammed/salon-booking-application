
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/otp_page/textformfield_controller.dart';

class OtpBoxes extends StatelessWidget {
  const OtpBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          width: mediaqueryHeight(0.065, context),
          height: mediaqueryHeight(0.065, context),
          margin: EdgeInsets.all(10),
          child: TextFormField(
            style: TextStyle(
                color: blackColor
                ,
                fontWeight: FontWeight.w700,
                fontFamily: cabinCondensed,
                fontSize: 20),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: blackColor,
            enableInteractiveSelection: false,
            onChanged: (value) => onOtpChanged(value, index,context),
            controller: controllers[index],
            focusNode: focusNodes[index],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10),
              fillColor: greyColor2,
              filled: true,
              counterText: "",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
