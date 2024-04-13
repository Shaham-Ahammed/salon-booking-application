import 'package:flutter/material.dart';

final List<FocusNode> registerOtpFocusNodes =
    List.generate(4, (index) => FocusNode());

final List<TextEditingController> registerOtpControllers = List.generate(
  4,
  (index) => TextEditingController(),
);

void onregisterOtpChanged(String newText, int index, context) {
  if (newText.isNotEmpty) {
    if (index < 3) {
      FocusScope.of(context).requestFocus(registerOtpFocusNodes[index + 1]);
    } else {}
  }
}
