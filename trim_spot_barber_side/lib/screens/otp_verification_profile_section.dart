import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/profile.dart';
import 'package:trim_spot_barber_side/screens/registration_successful.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/otp_page/textformfield_controller.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/heading_texts.dart';
import 'package:trim_spot_barber_side/widgets/otp_page/submit_button.dart';

class OtpVerficationProfileSection extends StatelessWidget {
  const OtpVerficationProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: mediaqueryHeight(0.03, context),
              color: whiteColor,
            )),
        centerTitle: true,
        title: myFont("OTP Verification",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.03, context),
            fontWeight: FontWeight.w600,
            fontColor: whiteColor),
      ),
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
                  myFont("Enter your 4 digit code",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.025, context),
                      fontWeight: FontWeight.w700,
                      fontColor: whiteColor),
                  checkMobileSms(),
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
                              onOtpChanged(value, index, context),
                          controller: controllers[index],
                          focusNode: focusNodes[index],
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
                  )),
                  SizedBox(
                    height: mediaqueryHeight(0.17, context),
                  ),
                  submitButtonCyan(context, function: () {
                    Navigator.of(context).push(NoTransitionPageRoute(
                        child: ProfileScreen()));
                    return null;
                  },
                      heigh: mediaqueryHeight(0.05, context),
                      text: "submit",
                      fontSize: mediaqueryHeight(0.024, context),
                      width: mediaqueryWidth(0.35, context))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
