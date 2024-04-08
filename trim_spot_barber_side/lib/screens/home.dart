import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: blackColor,
        body: Center(
        child: Text(
          "home",
          style: TextStyle(fontSize: 30, color: blackColor),
        ),
      ),
    );
  }
}