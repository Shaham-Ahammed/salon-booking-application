import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/registration_successful.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

submitButton(BuildContext context) {
  return submitButtonCyan(context, function: () {
    Navigator.of(context).push(
        NoTransitionPageRoute(child: RegistrationSuccessfulMessageScreen()));
    return null;
  },
      heigh: mediaqueryHeight(0.06, context),
      text: "submit",
      width: mediaqueryWidth(0.5, context));
}
