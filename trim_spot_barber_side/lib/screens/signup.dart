import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/signup_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/login_screen/background_image.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/closing_time_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/error_displays_widgets/closing_time_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/error_displays_widgets/location_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/error_displays_widgets/opening_time_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/error_displays_widgets/shop_image_error.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/headings.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/holiday_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/license_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/location_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/opening_time_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/profile_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/register_button.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/screen_padding.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/service_piker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/shop_image_picker.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/sizedbox.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/textfields.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/upi_id_textform_field.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/welocme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundImage(),
          child: SingleChildScrollView(
            reverse: false,
            child: Padding(
              padding: screenPadding(context),
              child: Form(
                key: registrationFormValidation,
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaqueryHeight(0.04, context),
                    ),
                    welcomeText(),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    const NameTextField(),
                    textFormFieldSizedBox(context),
                    const EmailTextFormField(),
                    textFormFieldSizedBox(context),
                    const PhoneTextFormField(),
                    textFormFieldSizedBox(context),
                    const ShopNameTextFormField(),
                    textFormFieldSizedBox(context),
                    const LocationPicker(),
                    LocationValidationErrorMessage(),
                    textFormFieldSizedBox(context),
                    const ProofsHeading(),
                    const SizedBox(
                      height: 3,
                    ),
                    const Row(
                      children: [
                        ShopLicensePicker(),
                        ProfilePicker(),
                      ],
                    ),
                    textFormFieldSizedBox(context),
                    const ShopImageHeading(),
                    const SizedBox(
                      height: 3,
                    ),
                    const ShopImagePicker(),
                    ShopImageError(),
                    textFormFieldSizedBox(context),
                    const ServiceHeading(),
                    const SizedBox(
                      height: 3,
                    ),
                    servicePicker(),
                    textFormFieldSizedBox(context),
                    const WorkingHoursHeading(),
                    const SizedBox(
                      height: 3,
                    ),
                    const OpeningTimePicker(),
                    OpenTimeError(),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    const ClosingTimePicker(),
                    ClosingTimeError(),
                    textFormFieldSizedBox(context),
                    const RegisterHeadings(heading: "Holidays"),
                    const SizedBox(
                      height: 3,
                    ),
                    HolidayPicker(),
                    textFormFieldSizedBox(context),
                    const UpiIdTextFormField(),
                    textFormFieldSizedBox(context),
                    PasswordTextFormField(),
                    textFormFieldSizedBox(context),
                    ConfirmPasswordTextFormField(),
                    SizedBox(
                      height: mediaqueryHeight(0.05, context),
                    ),
                    const RegisterButton(),
                    SizedBox(height: mediaqueryHeight(0.06, context)),
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