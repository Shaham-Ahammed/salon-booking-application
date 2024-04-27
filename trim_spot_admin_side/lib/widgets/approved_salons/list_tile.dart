import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/utils/page_route.dart';
import 'package:trim_spot_admin_side/utils/registration_details/categories.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_admin_side/screens/details_page.dart';

class ApprovedSalonListtile extends StatelessWidget {
  const ApprovedSalonListtile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.of(context).push(normalPageRoute(
                const RegistrationDetailsScreen(VerificationState.approved))),
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: .67, color: cyanColor),
                borderRadius: BorderRadius.circular(12)),
            tileColor: tileColor,
            leading: const ShopImage(),
            title: shopNameListTile(context),
            subtitle: shopLocationListTile(context),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: mediaqueryHeight(0.02, context),
          );
        },
        itemCount: 5);
  }

  shopLocationListTile(BuildContext context) {
    return myFont("calicut",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }

  shopNameListTile(BuildContext context) {
    return myFont("hipochi salon",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.023, context),
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }
}


class ShopImage extends StatelessWidget {
  const ShopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage("assets/images/s2.jpg"),
      backgroundColor: cyanColor,
    );
  }
}