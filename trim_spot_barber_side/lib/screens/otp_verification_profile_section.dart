import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/heading_texts.dart';
import 'package:trim_spot_barber_side/widgets/profile_otp_widgets/appbar.dart';
import 'package:trim_spot_barber_side/widgets/profile_otp_widgets/enter4digitcode.dart';
import 'package:trim_spot_barber_side/widgets/profile_otp_widgets/otp_boxes.dart';
import 'package:trim_spot_barber_side/widgets/profile_otp_widgets/submit_button.dart';

class OtpVerficationProfileSection extends StatelessWidget {
  const OtpVerficationProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOtpVerficiationProfile(context),
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: mediaqueryHeight(0.27, context),
                  ),
                  enter4digitcodeText(context),
                  checkMobileSms(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  Center(child: OtpBoxesProfile()),
                  SizedBox(
                    height: mediaqueryHeight(0.17, context),
                  ),
                  submitButtonOtpProfile(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
