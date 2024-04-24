// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase/image_storage_references.dart';
import 'package:trim_spot_barber_side/data/repository/register_profile_to_firebase.dart';
import 'package:trim_spot_barber_side/utils/registration_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';
import 'package:trim_spot_barber_side/utils/registration_page/service_convertion.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
part 'register_button_event.dart';
part 'register_button_state.dart';

class RegisterButtonBloc
    extends Bloc<RegisterButtonEvent, RegisterButtonState> {
  RegisterButtonBloc() : super(RegisterButtonInitial(buttonPressed: false)) {
    on<RegisterButtonPressed>(_registerButtonPressed);
  }
  _registerButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterButtonState> emit) async {
    emit(RegisterButtonInitial(buttonPressed: true));
    if ((registrationFormKey.currentState!.validate() &&
        locationValidation(event.context) &&
        shopImageValidation(event.context) &&
        profileValidation(event.context) &&
        closingTimeValidation(event.context) &&
        openingTimeValidation(event.context) &&
        shopServiceValidation(event.context) &&
        licenseValidation(event.context))) {
      serviceToMapConversion(event.context);
      try {
        await RegisterProfileToFirebase().addDatasToFirebase(event.context);
      } catch (e) {
        print("error $e");
      }

      emit(RegisterationSuccess(buttonPressed: state.buttonPressed));
      print("success");
    } else {
      print("registration failure");
      return;
    }
  }
}
