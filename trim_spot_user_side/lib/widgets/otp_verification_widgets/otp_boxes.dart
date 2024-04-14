import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/otp_page/otp_box.dart';
class OtpBoxes extends StatelessWidget {
  const OtpBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Container(
            width: mediaqueryHeight(0.065, context),
            height: mediaqueryHeight(0.065, context),
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: cabinCondensed,
                  fontSize: 20),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              cursorColor: blackColor,
              enableInteractiveSelection: false,
              onChanged: (value) => onregisterOtpChanged(value, index, context),
              controller: registerOtpControllers[index],
              focusNode: registerOtpFocusNodes[index],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                fillColor: greyColor2,
                filled: true,
                counterText: "",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}