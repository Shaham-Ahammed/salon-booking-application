import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text(
          "helllo",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
