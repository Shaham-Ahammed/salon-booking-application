

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ResendEmailButton extends StatelessWidget {
  const ResendEmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
              Colors.grey.withOpacity(.2)),
        ),
        onPressed: () {
          context.read<RegisterButtonBloc>().add(ResendEmailButtonPressed());
        },
        child: myFont("resend email",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.019, context),
            fontWeight: FontWeight.normal,
            fontColor: Colors.blue.shade100));
  }
}
