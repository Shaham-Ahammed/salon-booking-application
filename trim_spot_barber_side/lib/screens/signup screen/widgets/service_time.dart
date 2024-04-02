import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';

class ServiceTimeTextFormField extends StatelessWidget {
  const ServiceTimeTextFormField({
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
          keyboardType: TextInputType.number,
          maxLength: 3,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
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
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              disabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "min"),
        ),
      ),
    );
  }
}
