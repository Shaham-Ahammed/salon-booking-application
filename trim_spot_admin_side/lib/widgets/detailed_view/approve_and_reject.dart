import 'package:flutter/material.dart';

import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/widgets/detailed_view/approve_button.dart';
import 'package:trim_spot_admin_side/widgets/detailed_view/reject_button.dart';

class ApproveAndRejectButtons extends StatelessWidget {
  const ApproveAndRejectButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: mediaqueryWidth(0.07, context),
        ),
        const ApproveButton(),
        const RejectButton(),
        SizedBox(
          width: mediaqueryWidth(0.07, context),
        ),
      ],
    );
  }
}