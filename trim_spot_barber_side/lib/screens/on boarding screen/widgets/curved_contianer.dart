
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';


class OnBoardingTextAreaContainer extends StatelessWidget {
  const OnBoardingTextAreaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -mediaqueryHeight(0.1, context),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: mediaqueryHeight(0.45, context),
            width: mediaqueryHeight(0.45, context),
            child: Transform.scale(
              scale: 1.45,
              child: Container(
                width: double.infinity,
                height: mediaqueryHeight(0.45, context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: introductionColor),
              ),
            ),
          ),
        ));
  }
}
