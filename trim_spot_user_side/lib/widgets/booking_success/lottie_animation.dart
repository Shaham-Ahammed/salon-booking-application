import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:lottie/lottie.dart';

class TickMarkLottie extends StatelessWidget {
  const TickMarkLottie({
    super.key,
    required this.successAnimationController,
  });

  final AnimationController successAnimationController;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(onLoaded: (composition) {
      successAnimationController.duration = composition.duration;
    }, repeat: false, "assets/animations/booking_succes_lottie.json");
  }
}