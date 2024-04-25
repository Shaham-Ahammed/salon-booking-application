import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/screens/bottom_navigation.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/error_snackbars.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/heading_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/otp_fields.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/submit_button.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';
import 'package:lottie/lottie.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterButtonBloc, RegisterButtonState>(
      listener: (context, state) {
        if (state is RegistrationLoading) {
          loadingIndicator(context);
        }
        if (state is NetworkError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(networkErrorSnackbar(context));
          Navigator.pop(context);
        }
        if (state is RegisrationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar("some thing went wrong ${state.error}"));
          Navigator.pop(context);
        }
        if (state is RegistrationSuccess) {
          Navigator.pop(context);
          Navigator.of(context)
              .push(NoTransitionPageRoute(child: BottomNavigationScreen()));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: backgroundImage(),
            child: SingleChildScrollView(
              child: Padding(
                padding: screenPadding(context),
                child: Column(
                  children: [
                    pageTitle(context),
                    SizedBox(
                      height: mediaqueryHeight(0.26, context),
                    ),
                   Transform.scale(
                    scale: .5,
                    child: LottieBuilder.asset("assets/animations/email_sended.json",height: 30,)),
                    fourDigitCodeTitle(context),
                    submitButton(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
