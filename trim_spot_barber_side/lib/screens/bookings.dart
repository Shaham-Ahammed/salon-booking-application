import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
backgroundColor: blackColor,
       body: Center(
        child: Text(
          "bookings",
          style: TextStyle(fontSize: 30, color: blackColor),
        ),
      ),
    );
  }
}