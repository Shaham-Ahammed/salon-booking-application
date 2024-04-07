 import 'package:flutter/material.dart';

final List<FocusNode> focusNodes= List.generate(4, (index) => FocusNode()) ;

  final List<TextEditingController> controllers=List.generate(
      4,
      (index) => TextEditingController(),
    );

  void onOtpChanged(String newText, int index,context) {
    if (newText.isNotEmpty) {
      if (index <3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
  
      }
    }
  }