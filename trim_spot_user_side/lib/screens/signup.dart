import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/register_page/formkey.dart';
import 'package:trim_spot_user_side/utils/register_page/valuenotifier.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/textformfields.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/profile_image.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/profile_image_error.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/register_button.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/sizedbox.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/welcome.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundImage(),
        child: SingleChildScrollView(
          child: Padding(
            padding: screenPadding(context),
            child: Form(
              key: registerFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: mediaqueryHeight(0.04, context),
                  ),
                  welcomeText(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  ProfileImage(),
                  ProfileImageError(),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  TextFormFieldCyan(
                    validation: (value) {
                      if (value == "") {
                        return "please enter a name";
                      } else {
                        return null;
                      }
                    },
                    controller: registerUsernameController,
                    hintText: "Username",
                    textInputType: TextInputType.name,
                    filteringTextInputFormatter:
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ),
                  textFormFieldSizedBox(context),
                  TextFormFieldCyan(
                    validation: (value) {
                      if (value == "") {
                        return "please enter a email";
                      } else if (!value!.contains("@gmail.com")) {
                        return "enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    controller: registerEmailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  textFormFieldSizedBox(context),
                  TextFormFieldCyan(
                    validation: (value) {
                      if (value == "") {
                        return "please enter a phone number";
                      } else if (value!.length < 10) {
                        return "enter valid number";
                      } else {
                        return null;
                      }
                    },
                    controller: registerPhoneController,
                    hintText: "Phone",
                    textInputType: TextInputType.number,
                    maxLenght: 10,
                  ),
                  textFormFieldSizedBox(context),
                  TextFormFieldCyan(
                    validation: (value) {
                      if (value == "") {
                        return "please enter a password";
                      } else if (value!.length < 8) {
                        return "password must contian atleast 8 characters";
                      } else {
                        return null;
                      }
                    },
                    controller: registerPasswordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  textFormFieldSizedBox(context),
                  TextFormFieldCyan(
                    validation: (value) {
                      if (value == "") {
                        return "please enter confirmation password";
                      } else if (value != registerPasswordController.text) {
                        return "password mismatch";
                      } else {
                        return null;
                      }
                    },
                    controller: registerConfirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.04, context),
                  ),
                  RegisterButton(),
                  SizedBox(height: mediaqueryHeight(0.06, context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
