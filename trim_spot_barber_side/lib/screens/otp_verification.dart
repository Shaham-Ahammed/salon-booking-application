import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/login_widgets/background_image.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/heading_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/otp_fields.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/screen_padding.dart';

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
                  fourDigitCodeTitle(context),
                  checkMobileSms(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  Center(
                    child: OtpBoxes(),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.3, context),
                  ),
                  submitButtonCyan(context,
                      heigh: mediaqueryHeight(0.06, context),
                      text: "submit",
                      width: mediaqueryWidth(0.5, context))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



 


}
