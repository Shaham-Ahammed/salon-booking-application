import 'package:flutter/material.dart';

const String cabinCondensed = "CabinCondensed";
const String belleza = "Belleza";
const String bebasNeue = "BebasNeue";
const String b612 = "B612";
const String balooChettan = "Baloo Chettan";

myFontStyle( String text,
    {required  String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
    required Color fontColor}) {
  return Text(
    text,
    
    style: TextStyle(
      
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor),
  );
}
