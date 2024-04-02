import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/service%20switches%20bloc/service_selection_bloc_bloc.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/background_image.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/textformfields.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/closing_time_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/headings.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/holiday_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/license_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/location_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/opening_time_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/profile_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/register_button.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/screen_padding.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/service_piker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/shop_image_picker.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/sizedbox.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/textfields.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/upi_id_textform_field.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/welocme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundImage(),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: screenPadding(context),
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
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                const ClosingTimePicker(),
                textFormFieldSizedBox(context),
                const RegisterHeadings(heading: "Holidays"),
                const SizedBox(
                  height: 3,
                ),
                BlocBuilder<RegisterFormBloc, RegisterFormState>(
                  builder: (context, state) {
                    if (state is RegisterFormInitial) {
                      return HolidayPicker(weekDays: weekDays, state: state);
                    }
                    return Container();
                  },
                ),
                textFormFieldSizedBox(context),
                const UpiIdTextFormField(),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Password",
                  obscureText: true,
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
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
    );
  }
}
