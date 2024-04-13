import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/otp_verification_profile_section.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

class EditPhoneScreen extends StatelessWidget {
  const EditPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
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
        title: myFont("Edit Phone",
            fontFamily: belleza,
            fontSize: mediaqueryHeight(0.03, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myFont("This mobile number will be verified by an OTP",
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.015, context),
                  fontWeight: FontWeight.normal,
                  fontColor: greyColor),
              SizedBox(
                height: mediaqueryHeight(0.016, context),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaqueryWidth(0.02, context)),
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                height: mediaqueryHeight(0.06, context),
                child: TextFormField(
                  controller: newPhoneController,
                  cursorColor: blackColor,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: "enter new number",
                      counterText: "",
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: mediaqueryHeight(0.65, context),
              ),
              Center(
                  child: submitButtonCyan(context,
                      heigh: mediaqueryHeight(0.05, context),
                      text: "verify",
                      fontSize: mediaqueryHeight(0.024, context),
                      width: mediaqueryWidth(0.35, context), function: () {
                Navigator.of(context).push(NoTransitionPageRoute(
                    child: OtpVerficationProfileSection()));
                return null;
              }))
            ],
          ),
        ),
      )),
    );
  }
}
