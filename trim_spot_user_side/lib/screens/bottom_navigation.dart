import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/utils/bottom_navigation/list_of_screens.dart';
import 'package:trim_spot_user_side/utils/bottom_navigation/page_changing_listener.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: tabs[BlocProvider.of<BottomNavigationBloc>(context, listen: true)
          .state
          .currentPageIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        width: double.infinity,
        decoration: BoxDecoration(
            color: bottomNavBarColor, borderRadius: BorderRadius.circular(90)),
        height: mediaqueryHeight(0.09, context),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          bottomNavIcons(
              context,
              Icons.home,
              bottomBarIconColor(context) == 0
                  ? cyanColor
                  : nonSelectedIconBackgroundColor,
              bottomBarIconColor(context) == 0 ? blackColor : whiteColor,
              0),
          bottomNavIcons(
              context,
              Icons.search_outlined,
              bottomBarIconColor(context) == 1
                  ? cyanColor
                  : nonSelectedIconBackgroundColor,
              bottomBarIconColor(context) == 1 ? blackColor : whiteColor,
              1),
          bottomNavIcons(
              context,
              Icons.event,
              bottomBarIconColor(context) == 2
                  ? cyanColor
                  : nonSelectedIconBackgroundColor,
              bottomBarIconColor(context) == 2 ? blackColor : whiteColor,
              2),
          bottomNavIcons(
              context,
              Icons.person,
              bottomBarIconColor(context) == 3
                  ? cyanColor
                  : nonSelectedIconBackgroundColor,
              bottomBarIconColor(context) == 3 ? blackColor : whiteColor,
              3),
        ]),
      ),
    );
  }

  Material bottomNavIcons(BuildContext context, IconData icon, Color boxColor,
      Color iconColor, int itemPosititon) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: boxColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          context
              .read<BottomNavigationBloc>()
              .add(BottomNavBarPressed(currentPage: itemPosititon));
        },
        child: Container(
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
