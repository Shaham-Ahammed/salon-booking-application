import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/home/scaffold_key.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/app_bar.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/category_items.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/nearbysalon_listtile.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/search_box.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/viewmore_button.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/close_button.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/divider.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/listtile_items.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/profile_image.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/user_details.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        child: Column(
          children: [
            const CloseButtonDrawer(),
            Row(
              children: [
                const Stack(
                  children: [
                    ProfileImageDisplay(),
                    ProfileImageEditButton()
                  ],
                ),
                SizedBox(
                  width: mediaqueryHeight(0.02, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userName(context),
                    userEmail(context),
                    userPhone(context),
                  ],
                )
              ],
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            const DrawerDivider(),
            SizedBox(
              height: mediaqueryHeight(0.01, context),
            ),
           listviewDrawerHome(context),
           
          ],
        ),
      ),
    );
  }
}

