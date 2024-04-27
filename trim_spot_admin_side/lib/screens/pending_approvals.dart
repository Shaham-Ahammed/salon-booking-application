import 'package:flutter/material.dart';
import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/widgets/pending_approval/gridview.dart';
import 'package:trim_spot_admin_side/widgets/pending_approval/heading_text.dart';
import 'package:trim_spot_admin_side/widgets/pending_approval/list_tile.dart';

class PendingApprovalsScreen extends StatelessWidget {
  const PendingApprovalsScreen({super.key});

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
                const PendingApprovalText(),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 500) {
                        return const GridviewPendingAprroval();
                      } else {
                        return const ListviewPendingApproval();
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


