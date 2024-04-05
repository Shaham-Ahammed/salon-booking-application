import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/screens/login_or_signup/widgets/background_image.dart';
import 'package:trim_spot_barber_side/screens/login_or_signup/widgets/login_signup_buttons.dart';

import '../login_screen/login.dart';
import '../signup_screen/signup.dart';



class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardindBloc, OnboardindBlocState>(
        listener: (context, state) {
          if (state is NavigateToLogin) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: const LoginScreen()));
          }
          if (state is NavigateToSignUp) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: const SignUpScreen()));
          }
        },
        child: Stack(
          children: [
            const BackgroundImage(),
            loginPageButtons(
                context: context,
                left: 0.07,
                text: "LOGIN",
                textColor: blackColor,
                containerColor: cyanColor,
                borderColor: cyanColor,
                function: () =>
                    context.read<OnboardindBloc>().add(LoginButtonPressed())),
            loginPageButtons(
                context: context,
                left: 0.53,
                text: "SIGNUP",
                textColor: whiteColor,
                containerColor: transparentColor,
                borderColor: whiteColor,
                function: () =>
                    context.read<OnboardindBloc>().add(SignUpButtonPressed()))
          ],
        ),
      ),
    );
  }
}