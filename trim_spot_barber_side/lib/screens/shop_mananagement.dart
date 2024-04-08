import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';

class ShopManagementScreen extends StatelessWidget {
  const ShopManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: blackColor,
     
      body: Center(
        child: Text(
          "shop",
          style: TextStyle(fontSize: 30, color: blackColor),
        ),
      ),
    );
  }
}
