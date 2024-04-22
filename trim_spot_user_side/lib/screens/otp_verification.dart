import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/error_snackbars.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/backgorund_image.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/headings_and_texts.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/otp_box.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/submit_button.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String verificationId;
  const OtpVerificationScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormValidationBloc, FormValidationState>(
      listener: (context, state) {
        if (state is NavigateToHomePage) {
          Navigator.of(context)
              .push(NoTransitionPageRoute(child: const BottomNavigationBarScreen()));
        }

        if (state is SomethingWentWrongWithOtpValidation) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar("invalid otp"));
        }
        if (state is AddingToDataToFirebase) {
          loadingIndicator(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: backgorundImageOtpVerification(),
            child: SingleChildScrollView(
              child: Padding(
                padding: screenPadding(context),
                child: Column(
                  children: [
                    otpVerficationHeading(context),
                    SizedBox(
                      height: mediaqueryHeight(0.26, context),
                    ),
                    fourDigitCodeHeading(context),
                    captionText(),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    const OtpBoxe(),
                    SizedBox(
                      height: mediaqueryHeight(0.3, context),
                    ),
                    submitButtonOtpPage(context, verificationId)
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
