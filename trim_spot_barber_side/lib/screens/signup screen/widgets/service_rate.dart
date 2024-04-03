import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';


class ServiceRateTextFormField extends StatelessWidget {
  const ServiceRateTextFormField({
    super.key,
    required this.enabled,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaqueryHeight(0.033, context),
        child: TextField(
          cursorColor: cyanColor,
          keyboardType: TextInputType.number,
          maxLength: 4,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              counterText: "",
              hintStyle: TextStyle(
                  fontFamily: balooChettan,
                  color: enabled ? blackColor : greyColor,
                  fontSize: 14),
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: enabled ? whiteColor : greyColor3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabled: enabled,
              disabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "rate"),
        ),
      ),
    );
  }
}

