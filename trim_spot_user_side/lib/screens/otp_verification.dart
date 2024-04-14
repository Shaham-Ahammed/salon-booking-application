import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/backgorund_image.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/headings_and_texts.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/otp_boxes.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/submit_button.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const OtpBoxes(),
                  SizedBox(
                    height: mediaqueryHeight(0.3, context),
                  ),
                  submitButtonOtpPage(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}


