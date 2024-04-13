import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/home_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/otp_page/otp_box.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';

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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/spalsh user blur.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: mediaqueryHeight(0.04, context),
                  right: mediaqueryHeight(0.04, context),
                  top: mediaqueryHeight(0.04, context),
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  myFont("OTP Verification",
                      fontFamily: cabinCondensed,
                      fontSize: mediaqueryHeight(0.04, context),
                      fontWeight: FontWeight.w600,
                      fontColor: whiteColor),
                  SizedBox(
                    height: mediaqueryHeight(0.26, context),
                  ),
                  myFont("Enter your 4 digit code",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.032, context),
                      fontWeight: FontWeight.w700,
                      fontColor: whiteColor),
                  myFont("please check your phone sms",
                      fontFamily: balooChettan,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontColor: whiteColor),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Container(
                          width: mediaqueryHeight(0.065, context),
                          height: mediaqueryHeight(0.065, context),
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: cabinCondensed,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: blackColor,
                            enableInteractiveSelection: false,
                            onChanged: (value) =>
                                onregisterOtpChanged(value, index, context),
                            controller: registerOtpControllers[index],
                            focusNode: registerOtpFocusNodes[index],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              fillColor: greyColor2,
                              filled: true,
                              counterText: "",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.3, context),
                  ),
                  submitButtonCyan(context, function: () {
                    Navigator.of(context)
                        .push(NoTransitionPageRoute(child: HomeScreen()));
                    return null;
                  },
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
