
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

class EmailAndPasswordField extends StatelessWidget {
  const EmailAndPasswordField({
    super.key,
    required this.hintText, required this.obscureText,
  });
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          TextStyle(fontFamily: balooChettan, color: greyColor2, fontSize: 18),
      obscureText: obscureText,
      cursorColor: cyanColor,
      decoration: InputDecoration(
        
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
