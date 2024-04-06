import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final registrationFormValidation = GlobalKey<FormState>();

List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

final TextEditingController registrationNameController =
    TextEditingController();

final TextEditingController registrationEmailController =
    TextEditingController();

final TextEditingController registrationPhoneController =
    TextEditingController();

final TextEditingController registrationShopNameController =
    TextEditingController();

final TextEditingController registrationUpiController = TextEditingController();

final TextEditingController registrationPasswordController =
    TextEditingController();

final TextEditingController registrationConfirmPasswordController =
    TextEditingController();
