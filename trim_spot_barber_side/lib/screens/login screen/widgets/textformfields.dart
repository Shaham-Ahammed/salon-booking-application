import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';


class TextFormFieldCyan extends StatelessWidget {
  const TextFormFieldCyan(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.maxLenght,
      this.filteringTextInputFormatter});
  final String hintText;
  final TextInputType textInputType;
  final FilteringTextInputFormatter? filteringTextInputFormatter;
  final bool obscureText;
 final int? maxLenght;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: filteringTextInputFormatter == null
          ? null
          : [filteringTextInputFormatter!],
     maxLength:maxLenght??maxLenght ,
      style:
          TextStyle(fontFamily: balooChettan, color: greyColor2, fontSize: 18),
      obscureText: obscureText,
      cursorColor: cyanColor,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: Colors.black54,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 2, color: cyanColor)),
        contentPadding: EdgeInsets.symmetric(
            vertical: mediaqueryHeight(0.015, context),
            horizontal: mediaqueryWidth(0.06, context)),
        hintStyle: TextStyle(
            fontFamily: balooChettan, color: greyColor2, fontSize: 18),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: cyanColor),
            borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
