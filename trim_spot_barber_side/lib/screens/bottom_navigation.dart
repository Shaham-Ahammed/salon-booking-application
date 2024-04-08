import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/bottom_navigation/page_index.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bottom_navigation_list.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/bottom_navigation/bottom_nav_bar.dart';
import 'package:trim_spot_barber_side/widgets/bottom_navigation/padding.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: tabs[pageIndex(context)],
        bottomNavigationBar: Padding(
          padding: bottomNavPadding(context),
          child: Container(
            height: mediaqueryHeight(0.08, context),
            child: BottomNavBar(),
          ),
        ));
  }
}
