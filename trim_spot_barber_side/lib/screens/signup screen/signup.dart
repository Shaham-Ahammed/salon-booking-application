import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/service%20switches%20bloc/service_selection_bloc_bloc.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/font.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/mediaquery.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/background_image.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/textformfields.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/register_button.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/sizedbox.dart';
import 'package:dotted_border/dotted_border.dart';

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
            padding: EdgeInsets.only(
                left: mediaqueryHeight(0.04, context),
                right: mediaqueryHeight(0.04, context),
                top: mediaqueryHeight(0.04, context),
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryHeight(0.04, context),
                ),
                myFont("welcome",
                    fontFamily: cabinCondensed,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    fontColor: whiteColor),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                TextFormFieldCyan(
                  hintText: "Name",
                  textInputType: TextInputType.name,
                  filteringTextInputFormatter:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Phone",
                  textInputType: TextInputType.number,
                  maxLenght: 10,
                ),
                textFormFieldSizedBox(context),
                const TextFormFieldCyan(
                  hintText: "Shop Name",
                  textInputType: TextInputType.name,
                ),
                textFormFieldSizedBox(context),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: greyColor,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: mediaqueryHeight(0.06, context),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.045, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myFont("Shop Location",
                                fontFamily: balooChettan,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontColor: Colors.black54),
                            Icon(
                              Icons.location_pin,
                              color: Colors.red.shade800,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                textFormFieldSizedBox(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: myFont("Proofs",
                      fontFamily: balooChettan,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontColor: greyColor2),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: mediaqueryHeight(0.25, context),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomLeft: Radius.circular(14)),
                            border: Border.all(color: cyanColor, width: 2)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: mediaqueryHeight(0.015, context),
                            ),
                            myFont("Shop License",
                                fontFamily: balooChettan,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontColor: greyColor2),
                            SizedBox(
                              height: mediaqueryHeight(0.02, context),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: mediaqueryHeight(0.02, context),
                                    right: mediaqueryHeight(0.02, context),
                                    bottom: mediaqueryHeight(0.04, context)),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: DottedBorder(
                                      color: cyanColor,
                                      child: Center(
                                        child: Icon(
                                          Icons.document_scanner_outlined,
                                          color: greyColor,
                                          size: 30,
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: mediaqueryHeight(0.25, context),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(14),
                                bottomRight: Radius.circular(14)),
                            border: Border.all(color: cyanColor, width: 2)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: mediaqueryHeight(0.015, context),
                            ),
                            myFont("Profile",
                                fontFamily: balooChettan,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontColor: greyColor2),
                            SizedBox(
                              height: mediaqueryHeight(0.02, context),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: mediaqueryHeight(0.02, context),
                                    right: mediaqueryHeight(0.02, context),
                                    bottom: mediaqueryHeight(0.04, context)),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: DottedBorder(
                                      color: cyanColor,
                                      child: Center(
                                        child: Icon(
                                          Icons.person_outline,
                                          color: greyColor,
                                          size: 30,
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                textFormFieldSizedBox(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: myFont("Shop Image",
                      fontFamily: balooChettan,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontColor: greyColor2),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: double.infinity,
                  height: mediaqueryHeight(0.25, context),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cyanColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 3,
                      ),
                      myFont(
                          "This image will be seen by clients as a reference to your shop",
                          fontFamily: balooChettan,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontColor: greyColor2),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DottedBorder(
                                color: cyanColor,
                                child: Center(
                                  child: Icon(
                                    Icons.store,
                                    size: 35,
                                    color: greyColor,
                                  ),
                                )),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                textFormFieldSizedBox(context),
                const RegisterHeadings(
                  heading: "Services",
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cyanColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<RegisterFormBloc, RegisterFormState>(
                      builder: (context, state) {
                        if (state is RegisterFormInitial) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              myFont(
                                  "This can be modified later after registeration",
                                  fontFamily: balooChettan,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  fontColor: greyColor,
                                  textalign: TextAlign.start),
                              const SizedBox(
                                height: 3,
                              ),
                              registerServices(context, "HAIRCUT         ",
                                  state.switches["haircut"]!, "haircut"),
                              registerServices(context, "FACIAL             ",
                                  state.switches["facial"]!, "facial"),
                              registerServices(context, "STRAIGHTEN ",
                                  state.switches["straighten"]!, "straighten"),
                              registerServices(context, "MASSAGE       ",
                                  state.switches["massage"]!, "massage"),
                              registerServices(context, "BEARD TRIM ",
                                  state.switches["beard trim"]!, "beard trim"),
                              registerServices(context, "SHAVE             ",
                                  state.switches["shave"]!, "shave")
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
                textFormFieldSizedBox(context),
                const RegisterHeadings(
                  heading: "Working Hours",
                ),
                const SizedBox(
                  height: 3,
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black54,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: cyanColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: mediaqueryHeight(0.07, context),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.045, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myFont("Opening Time",
                                fontFamily: balooChettan,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontColor: greyColor2),
                            Transform.flip(
                              flipX: true,
                              child: Icon(Icons.schedule,
                                  color: Colors.blue.shade400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black54,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: cyanColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: mediaqueryHeight(0.07, context),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaqueryWidth(0.045, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myFont("Closing Time",
                                fontFamily: balooChettan,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontColor: greyColor2),
                            Icon(
                              Icons.schedule,
                              color: Colors.red.shade600,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                textFormFieldSizedBox(context),
                const RegisterHeadings(heading: "Holidays"),
                const SizedBox(
                  height: 3,
                ),
                BlocBuilder<RegisterFormBloc, RegisterFormState>(
                  builder: (context, state) {
                    if (state is RegisterFormInitial) {
                      return SizedBox(
                        height: mediaqueryHeight(0.05, context),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => context
                                    .read<RegisterFormBloc>()
                                    .add(
                                        HolidaysSelected(day: weekDays[index])),
                                child: Container(
                                    height: mediaqueryHeight(0.02, context),
                                    width: mediaqueryWidth(0.27, context),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: state.holidays
                                                  .contains(weekDays[index])?cyanColor: greyColor,width: 2),
                                        borderRadius: BorderRadius.circular(90),
                                        color: state.holidays
                                                .contains(weekDays[index])
                                            ? cyanColor
                                            : greyColor3),
                                    child: Center(
                                      child: myFont(weekDays[index],
                                          fontFamily: balooChettan,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontColor: state.holidays
                                                  .contains(weekDays[index])
                                              ? blackColor
                                              : greyColor),
                                    )),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: mediaqueryWidth(0.04, context),
                                ),
                            itemCount: 7),
                      );
                    }
                    return Container();
                  },
                ),
                textFormFieldSizedBox(context),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cyanColor, width: 2)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                              fontFamily: balooChettan,
                              color: greyColor2,
                              fontSize: 18),
                          cursorColor: cyanColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: mediaqueryHeight(0.015, context),
                                horizontal: mediaqueryWidth(0.06, context)),
                            hintStyle: TextStyle(
                                fontFamily: balooChettan,
                                color: greyColor2,
                                fontSize: 18),
                            hintText: "UPI id",
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: myFont("verify",
                              fontFamily: balooChettan,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontColor: whiteColor),
                        ),
                      ),
                      SizedBox(
                        width: mediaqueryWidth(0.03, context),
                      ),
                    ],
                  ),
                ),
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

  Column registerServices(
      BuildContext context, String service, bool state, String serviceName) {
    return Column(
      children: [
        Row(
          children: [
            myFont(service,
                fontFamily: balooChettan,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontColor: greyColor),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: cyanColor,
                value: state,
                onChanged: (value) {
                  context
                      .read<RegisterFormBloc>()
                      .add(ServiceSwitchPressed(service: serviceName));
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            SizedBox(
              width: mediaqueryWidth(0.01, context),
            ),
            ServiceTimeTextFormField(enabled: state),
            SizedBox(
              width: mediaqueryWidth(0.02, context),
            ),
            ServiceRateTextFormField(enabled: state)
          ],
        ),
        SizedBox(
          height: mediaqueryHeight(0.011, context),
        ),
      ],
    );
  }
}

class RegisterHeadings extends StatelessWidget {
  final String heading;
  const RegisterHeadings({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: myFont(heading,
          fontFamily: balooChettan,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontColor: greyColor2),
    );
  }
}

class ServiceRateTextFormField extends StatelessWidget {
  const ServiceRateTextFormField({
    super.key,
    required this.enabled,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaqueryHeight(0.033, context),
        child: TextField(
          cursorColor: cyanColor,
          keyboardType: TextInputType.number,
          maxLength: 4,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              counterText: "",
              hintStyle: TextStyle(    fontFamily: balooChettan,
                  color: enabled ? blackColor : greyColor, fontSize: 14),
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: enabled ? whiteColor : greyColor3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabled: enabled,
              disabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "rate"),
        ),
      ),
    );
  }
}

class ServiceTimeTextFormField extends StatelessWidget {
  const ServiceTimeTextFormField({
    super.key,
    required this.enabled,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaqueryHeight(0.033, context),
        child: TextField(
          keyboardType: TextInputType.number,
          maxLength: 3,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              counterText: "",
              hintStyle: TextStyle(
                fontFamily: balooChettan,
                  color: enabled ? blackColor : greyColor, fontSize: 14),
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: enabled ? whiteColor : greyColor3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabled: enabled,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              disabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color:greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "min"),
        ),
      ),
    );
  }
}
