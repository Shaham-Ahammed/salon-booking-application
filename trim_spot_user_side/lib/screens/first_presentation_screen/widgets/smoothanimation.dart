
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trim_spot_user_side/blocs/on%20boarding%20bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

import '../modals/introduction_lists.dart';

class SmoothPageIndincatorAndNextButton extends StatelessWidget {
  const SmoothPageIndincatorAndNextButton({
    super.key,
    required this.pageController,
    required this.controller,
  });

  final PageController pageController;
  final InroductionItems controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: mediaqueryWidth(0.11, context),
          right: mediaqueryWidth(0.11, context),
          bottom: mediaqueryHeight(0.09, context)),
      color: introductionColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: controller.items.length,
            effect: JumpingDotEffect(activeDotColor: cyanColor),
          ),
          SizedBox(width: mediaqueryWidth(0.33, context)),
          InkWell(
            onTap: () {
              context
                  .read<OnboardindBloc>()
                  .add(NextButtonPressed(pageController.page!));
            },
            child: Container(
              width: mediaqueryWidth(0.16, context),
              height: mediaqueryWidth(0.15, context),
              decoration: BoxDecoration(
                  color: cyanColor, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          )
        ],
      ),
    );
  }
}