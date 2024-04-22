import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';

class MyAppointmentsDetailsScreen extends StatelessWidget {
  const MyAppointmentsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: commonScreenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: greyColor3,
              borderRadius: BorderRadius.circular(90),
              child: InkWell(
                borderRadius: BorderRadius.circular(90),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: mediaqueryHeight(0.035, context),
                  width: mediaqueryHeight(0.035, context),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: mediaqueryHeight(0.024, context),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
