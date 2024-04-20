// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/signup_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';

part 'register_button_event.dart';
part 'register_button_state.dart';

class RegisterButtonBloc
    extends Bloc<RegisterButtonEvent, RegisterButtonState> {
  RegisterButtonBloc() : super(RegisterButtonInitial(buttonPressed: false)) {
    on<RegisterButtonPressed>(_registerButtonPressed);
  }
  _registerButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterButtonState> emit) {
    emit(RegisterButtonInitial(buttonPressed: true));
    if ((registrationFormValidation.currentState!.validate() &&
        locationValidation(event.context) &&
        shopImageValidation(event.context) &&
        profileValidation(event.context) &&
        closingTimeValidation(event.context) &&
        openingTimeValidation(event.context) &&
        licenseValidation(event.context))) {
      emit(RegisterationSuccess(buttonPressed: state.buttonPressed));
      print("success");
    } else {
      print("registration failure");
      return;
    }
  }
}
