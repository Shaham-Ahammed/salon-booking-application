import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/utils/bottom_navigation/list_of_screens.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/widgets/bottom_nav_bar/bottom_nav_container.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: tabs[BlocProvider.of<BottomNavigationBloc>(context, listen: true)
          .state
          .currentPageIndex],
      bottomNavigationBar: bottomNavigationBarContainer(context),
    );
  }



}
