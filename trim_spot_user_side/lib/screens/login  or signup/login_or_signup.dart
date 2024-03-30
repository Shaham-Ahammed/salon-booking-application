import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/blocs/on%20boarding%20bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/reusable%20widgets/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/reusable%20widgets/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/screens/login%20screen/login.dart';
import 'package:trim_spot_user_side/screens/signup%20screen/signup.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardindBloc, OnboardindBlocState>(
        listener: (context, state) {
          if (state is NavigateToLogin) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: LoginScreen()));
          }
          if (state is NavigateToSignUp) {
            Navigator.of(context)
                .push(SlideTransitionPageRoute(child: SignUpScreen()));
          }
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/images/spalsh user.jpg",
              height: double.infinity,
              fit: BoxFit.cover,
            ),
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

loginPageButtons(
    {required context,
    required double left,
    required String text,
    required Color textColor,
    required Color containerColor,
    required Color borderColor,
    required Function() function}) {
  return Positioned(
    bottom: mediaqueryHeight(0.07, context),
    left: mediaqueryWidth(left, context),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: function,
        child: Container(
          width: mediaqueryWidth(0.42, context),
          height: mediaqueryHeight(0.07, context),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: borderColor)),
          child: Center(
            child: myFont(text,
                fontFamily: cabinCondensed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textalign: TextAlign.center,
                fontColor: textColor),
          ),
        ),
      ),
    ),
  );
}
