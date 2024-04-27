import 'package:flutter/material.dart';
import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/widgets/approved_salons/approved_text.dart';
import 'package:trim_spot_admin_side/widgets/approved_salons/grid_view.dart';
import 'package:trim_spot_admin_side/widgets/approved_salons/list_tile.dart';

class ApprovedSalonsScreen extends StatelessWidget {
  const ApprovedSalonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                const ApprovedSalonText(),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 500) {
                        return const ApprovedSalonGridView();
                      } else {
                        return const ApprovedSalonListtile();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}





