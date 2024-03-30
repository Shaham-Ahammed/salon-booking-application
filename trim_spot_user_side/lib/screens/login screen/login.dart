import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/cyan_container.dart';
import 'package:trim_spot_user_side/reusable%20widgets/font.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/spalsh user blur.jpg",
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: EdgeInsets.all(mediaqueryHeight(0.04, context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: mediaqueryHeight(0.45, context),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(90),
                    color: greyColor2,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(90),
                      onTap: () {},
                      child: Container(
                        height: mediaqueryHeight(0.06, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/mdi--google.svg"),
                            SizedBox(
                              width: mediaqueryWidth(0.04, context),
                            ),
                            myFont("Sign in with google",
                                fontFamily: balooChettan,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontColor: blackColor)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.01, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mediaqueryWidth(0.05, context),
                      ),
                      Container(
                        color: Colors.white30,
                        height: 1,
                        width: mediaqueryWidth(0.3, context),
                      ),
                      SizedBox(
                        width: mediaqueryWidth(0.04, context),
                      ),
                      myFont("or",
                          fontFamily: balooChettan,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontColor: greyColor2),
                      SizedBox(
                        width: mediaqueryWidth(0.04, context),
                      ),
                      Container(
                        color: Colors.white30,
                        height: 01,
                        width: mediaqueryWidth(0.3, context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  const EmailAndPasswordField(hintText: "Email",obscureText: false,),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  const EmailAndPasswordField(hintText: "Password",obscureText: true,),
                  SizedBox(
                    height: mediaqueryHeight(0.04, context),
                  ),
                  Material(
                    color: cyanColor,
                    borderRadius: BorderRadius.circular(90),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(90),
                      child: Container(
                        decoration: cyanContainer(transparentColor),
                        width: mediaqueryWidth(0.45, context),
                        height: mediaqueryHeight(0.06, context),
                        child: Center(
                          child: myFont("Login",
                              fontFamily: balooChettan,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontColor: blackColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.04, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myFont("Don't have an account ? ",
                          fontFamily: balooChettan,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontColor: whiteColor),
                      myFont("Register Now",
                          fontFamily: balooChettan,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontColor: cyanColor),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailAndPasswordField extends StatelessWidget {
  const EmailAndPasswordField({
    super.key,
    required this.hintText, required this.obscureText,
  });
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          TextStyle(fontFamily: balooChettan, color: greyColor2, fontSize: 18),
      obscureText: obscureText,
      cursorColor: cyanColor,
      decoration: InputDecoration(
        
        filled: true,
        fillColor: Colors.black54,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 2, color: cyanColor)),
        contentPadding: EdgeInsets.symmetric(
            vertical: mediaqueryHeight(0.015, context),
            horizontal: mediaqueryWidth(0.06, context)),
        hintStyle: TextStyle(
            fontFamily: balooChettan, color: greyColor2, fontSize: 18),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: cyanColor),
            borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
