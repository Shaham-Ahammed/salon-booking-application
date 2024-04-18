import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/utils/bottom_navigation/list_of_screens.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/home/scaffold_key.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/bottom_nav_bar/bottom_nav_container.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/close_button.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/divider.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/listtile_items.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/profile_image.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/user_details.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/version_number.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
     
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child: tabs[state.currentPageIndex],
          );
        },
      ),
      bottomNavigationBar: bottomNavigationBarContainer(context),
    );
  }
}
