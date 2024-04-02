 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/service%20switches%20bloc/service_selection_bloc_bloc.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/service_rate.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/service_time.dart';
 
  Column registerServices(
      BuildContext context, String service, bool state, String serviceName) {
    return Column(
      children: [
        Row(
          children: [
            myFont(service,
                fontFamily: balooChettan,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontColor: greyColor),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: cyanColor,
                value: state,
                onChanged: (value) {
                  context
                      .read<RegisterFormBloc>()
                      .add(ServiceSwitchPressed(service: serviceName));
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            SizedBox(
              width: mediaqueryWidth(0.01, context),
            ),
            ServiceTimeTextFormField(enabled: state),
            SizedBox(
              width: mediaqueryWidth(0.02, context),
            ),
            ServiceRateTextFormField(enabled: state)
          ],
        ),
        SizedBox(
          height: mediaqueryHeight(0.011, context),
        ),
      ],
    );
  }