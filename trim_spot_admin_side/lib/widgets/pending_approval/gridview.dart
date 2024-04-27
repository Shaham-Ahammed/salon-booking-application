import 'package:flutter/material.dart';
import 'package:trim_spot_admin_side/screens/details_page.dart';
import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/utils/page_route.dart';
import 'package:trim_spot_admin_side/utils/registration_details/categories.dart';

class GridviewPendingAprroval extends StatelessWidget {
  const GridviewPendingAprroval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.85,
          crossAxisCount: 5,
          mainAxisSpacing: mediaqueryHeight(0.03, context),
          crossAxisSpacing: mediaqueryHeight(0.035, context)),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(normalPageRoute(
                const RegistrationDetailsScreen(VerificationState.pending)));
          },
          child: Container(
            decoration: BoxDecoration(
                color: tileColor,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(color: cyanColor, width: .7)),
            child: const Column(
              children: [
                ShopImageGridViewPendingApproval(),
                ShopNameGridViewPendingApproval(),
                ShopLocationGridViewPendingApproval(),
              ],
            ),
          ),
        );
      },
      itemCount: 9,
    );
  }
}

class ShopLocationGridViewPendingApproval extends StatelessWidget {
  const ShopLocationGridViewPendingApproval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "calicut",
      textAlign: TextAlign.start,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: belleza,
          fontSize: mediaqueryWidth(0.013, context),
          fontWeight: FontWeight.w500,
          color: whiteColor),
    );
  }
}

class ShopNameGridViewPendingApproval extends StatelessWidget {
  const ShopNameGridViewPendingApproval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "hipochi salon",
      textAlign: TextAlign.start,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: belleza,
          fontSize: mediaqueryWidth(0.015, context),
          fontWeight: FontWeight.w500,
          color: whiteColor),
    );
  }
}

class ShopImageGridViewPendingApproval extends StatelessWidget {
  const ShopImageGridViewPendingApproval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryWidth(0.13, context),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/s2.jpg"))),
    );
  }
}
