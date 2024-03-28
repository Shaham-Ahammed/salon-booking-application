import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trim_spot_user_side/blocs/on%20boarding%20bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

import 'package:trim_spot_user_side/screens/first_presentation_screen/modals/introduction_lists.dart';
import 'package:trim_spot_user_side/screens/login%20%20or%20signup/login_or_signup.dart';

import '../../reusable widgets/page transitions/page_transition.dart';

class FirstIntroductionPage extends StatelessWidget {
  FirstIntroductionPage({super.key});

  final controller = InroductionItems();

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardindBloc, OnboardindBlocState>(
      listener: (context, state) {
        if (state is NavigateToSecondOnBoardingPage) {
          pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }
        if (state is NavigateToLoginOrSignupPage) {
          Navigator.of(context).push(CustomPageRoute(
              child: const LoginOrSignup(), direction: AxisDirection.right));
        }
      },
      child: Scaffold(
          bottomSheet: Container(
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
                        color: cyanColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                )
              ],
            ),
          ),
          body: PageView.builder(
            controller: pageController,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Transform.scale(
                        scale: 1.3,
                        child: Image.asset(
                            filterQuality: FilterQuality.high,
                            height: mediaqueryHeight(0.6, context),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            controller.items[index].imagePath),
                      ),
                    ),
                  ),
                  Positioned(
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
                                  shape: BoxShape.circle,
                                  color: introductionColor),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: mediaqueryWidth(0.1, context),
                      bottom: mediaqueryHeight(0.3, context),
                      child: myFontStyle(controller.items[index].title,
                          fontFamily: b612,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontColor: whiteColor)),
                  Positioned(
                      left: mediaqueryWidth(0.1, context),
                      bottom: mediaqueryHeight(0.25, context),
                      child: myFontStyle(controller.items[index].title2,
                          fontFamily: b612,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontColor: cyanColor)),
                  Positioned(
                      bottom: mediaqueryHeight(0.19, context),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.1, context)),
                        child: myFontStyle(controller.items[index].subtitle,
                            fontFamily: balooChettan,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontColor: greyColor),
                      )),
                ],
              );
            },
          )),
    );
  }
}
