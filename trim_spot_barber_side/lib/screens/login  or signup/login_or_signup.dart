import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on%20boarding%20bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/page%20transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/screens/login%20%20or%20signup/widgets/background_image.dart';
import 'package:trim_spot_barber_side/screens/login%20%20or%20signup/widgets/login_signup_buttons.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/login.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/signup.dart';


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