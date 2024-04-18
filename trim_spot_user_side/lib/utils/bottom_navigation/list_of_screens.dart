import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/bookings.dart';
import 'package:trim_spot_user_side/screens/home.dart';
import 'package:trim_spot_user_side/screens/profile.dart';
import 'package:trim_spot_user_side/screens/search_screen.dart';

List<Widget> tabs = [
  const HomeScreen(),
  const SearchScreen(),
  const BookingsScreen(),
   const ProfileScreen()
];
