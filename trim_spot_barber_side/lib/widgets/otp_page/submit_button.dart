import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

submitButton(BuildContext context) {
  return submitButtonCyan(context, function: () {
    // Navigator.of(context).push(
    //     NoTransitionPageRoute(child: RegistrationSuccessfulMessageScreen()));
    context.read<RegisterButtonBloc>().add(VerifyEmailPressed(context: context));
    return null;
  },
      heigh: mediaqueryHeight(0.044, context),
      text: "continue",
      fontSize: mediaqueryHeight(0.023, context),
      width: mediaqueryWidth(0.4, context));
}
