import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/models/introduction_lists.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/curved_contianer.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/images.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/smoothanimation.dart';
import 'package:trim_spot_barber_side/widgets/on_boarding_screen_widgets/title_and_description.dart';

import 'login_or_signup.dart';






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
          Navigator.of(context).push(FadeTransitionPageRoute(
            child: const LoginOrSignup(),
          //  direction: AxisDirection.right,
          ));
        }
      },
      child: Scaffold(
          bottomSheet: SmoothPageIndincatorAndNextButton(
              pageController: pageController, controller: controller),
          body: PageView.builder(
            controller: pageController,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  BoardingScreenImages(
                    controller: controller,
                    index: index,
                  ),
                  const OnBoardingTextAreaContainer(),
                  OnBoardingTitle(
                    controller: controller,
                    index: index,
                  ),
                  OnBoardingTitle2(
                    controller: controller,
                    index: index,
                  ),
                  OnBoardingDescription(
                    controller: controller,
                    index: index,
                  ),
                ],
              );
            },
          )),
    );
  }
}
