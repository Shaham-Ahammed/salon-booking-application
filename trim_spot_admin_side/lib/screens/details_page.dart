import 'package:flutter/material.dart';

import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';
import 'package:trim_spot_admin_side/utils/registration_details/categories.dart';
import 'package:trim_spot_admin_side/widgets/login/appbar.dart';

class RegistrationDetailsScreen extends StatelessWidget {
  final VerificationState shopState;
  const RegistrationDetailsScreen(this.shopState, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: PreferredSize(
        
          preferredSize: Size(double.infinity, mediaqueryHeight(0.1, context)),
          child: const AppBarLogin()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(mediaqueryHeight(0.04, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsHeadingAndDetails(context, "Name", "shuhaib malik"),
              detailsHeadingAndDetails(context, "Phone", "14342342324"),
              detailsHeadingAndDetails(context, "Email", "shu@gmail.com"),
              detailsHeadingAndDetails(context, "Shop Name", "Hipochi Salons"),
              detailsHeadingAndDetails(context, "Shop Location", "tirur"),
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myFont("Shop License",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.026, context),
                          fontWeight: FontWeight.w500,
                          fontColor: greyColor),
                      Container(
                        width: mediaqueryWidth(0.29, context),
                        height: mediaqueryHeight(0.3, context),
                        decoration: const BoxDecoration(
                            color: appBarColor,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/s2.jpg"))),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myFont("Profile Image",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.026, context),
                          fontWeight: FontWeight.w500,
                          fontColor: greyColor),
                      Container(
                        width: mediaqueryWidth(0.29, context),
                        height: mediaqueryHeight(0.3, context),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/s3.jpg",
                                ))),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myFont("Shop Image",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.026, context),
                          fontWeight: FontWeight.w500,
                          fontColor: greyColor),
                      Container(
                        width: mediaqueryWidth(0.29, context),
                        height: mediaqueryHeight(0.3, context),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/s4.jpg"))),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: mediaqueryHeight(0.03, context),
              ),
              switch (shopState) {
                VerificationState.pending => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: mediaqueryWidth(0.07, context),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(90),
                        color: cyanColor,
                        child: InkWell(
                          hoverColor: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(90),
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90)),
                              height: mediaqueryHeight(0.07, context),
                              width: mediaqueryWidth(0.2, context),
                              child: Center(
                                child: myFont("Approve",
                                    fontFamily: balooChettan,
                                    fontSize: mediaqueryHeight(0.025, context),
                                    fontWeight: FontWeight.w600,
                                    fontColor: blackColor),
                              )),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(90),
                        color: redErrorColor,
                        child: InkWell(
                          hoverColor: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(90),
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90)),
                              height: mediaqueryHeight(0.07, context),
                              width: mediaqueryWidth(0.2, context),
                              child: Center(
                                child: myFont("Reject",
                                    fontFamily: balooChettan,
                                    fontSize: mediaqueryHeight(0.025, context),
                                    fontWeight: FontWeight.w600,
                                    fontColor: whiteColor),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: mediaqueryWidth(0.07, context),
                      ),
                    ],
                  ),
                VerificationState.rejected => Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(90),
                      color: cyanColor,
                      child: InkWell(
                        hoverColor: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(90),
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90)),
                            height: mediaqueryHeight(0.07, context),
                            width: mediaqueryWidth(0.2, context),
                            child: Center(
                              child: myFont("Approve",
                                  fontFamily: balooChettan,
                                  fontSize: mediaqueryHeight(0.025, context),
                                  fontWeight: FontWeight.w600,
                                  fontColor: blackColor),
                            )),
                      ),
                    ),
                  ),
                VerificationState.approved => Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(90),
                      color: redErrorColor,
                      child: InkWell(
                        hoverColor: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(90),
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90)),
                            height: mediaqueryHeight(0.07, context),
                            width: mediaqueryWidth(0.2, context),
                            child: Center(
                              child: myFont("Remove",
                                  fontFamily: balooChettan,
                                  fontSize: mediaqueryHeight(0.025, context),
                                  fontWeight: FontWeight.w600,
                                  fontColor: whiteColor),
                            )),
                      ),
                    ),
                  ),
              }
            ],
          ),
        ),
      )),
    );
  }

  Column detailsHeadingAndDetails(
      BuildContext context, String heading, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myFont(heading,
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.026, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: appBarColor),
          width: double.infinity,
          height: mediaqueryHeight(0.05, context),
          child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: myFont(content,
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.032, context),
                  fontWeight: FontWeight.w500,
                  fontColor: whiteColor)),
        ),
        SizedBox(
          height: mediaqueryHeight(0.02, context),
        )
      ],
    );
  }
}
