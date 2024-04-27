import 'package:flutter/material.dart';
import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/widgets/rejected_approvals/grid_view.dart';
import 'package:trim_spot_admin_side/widgets/rejected_approvals/list_tile.dart';
import 'package:trim_spot_admin_side/widgets/rejected_approvals/rejected_heading.dart';

class RejectedSalonsScreen extends StatelessWidget {
  const RejectedSalonsScreen({super.key});

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
                const RejectedApprovalHeading(),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 500) {
                        return const RejectedApprovalGridView();
                      } else {
                        return const RejectedApprovalListView();
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


