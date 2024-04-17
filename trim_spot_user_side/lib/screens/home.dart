import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/app_bar.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/category_items.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/nearbysalon_listtile.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/search_box.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/viewmore_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: screeenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarElements(),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  const SearchBox(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  categoriesHeading(context),
                  SizedBox(
                    height: mediaqueryHeight(0.015, context),
                  ),
                  firstThreeCategories(context),
                  SizedBox(
                    height: mediaqueryHeight(0.01, context),
                  ),
                  secongThreeCategories(context),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  nearbySalonsHeading(context),
                  SizedBox(
                    height: mediaqueryHeight(0.015, context),
                  ),
                  const NearbySalonsListviewWidget(),
                  const ViewMoreButton()
                ],
              ),
            ),
          ),
        ));
  }
}

