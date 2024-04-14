  import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/home_screen.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';
  
  submitButtonOtpPage(BuildContext context) {
   return submitButtonCyan(context, function: () {
      Navigator.of(context)
          .push(NoTransitionPageRoute(child: const HomeScreen()));
      return null;
    },
        heigh: mediaqueryHeight(0.06, context),
        text: "submit",
        width: mediaqueryWidth(0.5, context));
  }

 