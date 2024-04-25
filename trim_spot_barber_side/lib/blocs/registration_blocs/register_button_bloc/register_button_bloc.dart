// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_authentication/firebase_auth.dart';
import 'package:trim_spot_barber_side/data/repository/register_profile_to_firebase.dart';
import 'package:trim_spot_barber_side/utils/registration_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'register_button_event.dart';
part 'register_button_state.dart';

class RegisterButtonBloc
    extends Bloc<RegisterButtonEvent, RegisterButtonState> {
  RegisterButtonBloc() : super(RegisterButtonInitial(buttonPressed: false)) {
    on<RegisterButtonPressed>(_registerButtonPressed);
    on<VerifyEmailPressed>(_verifyEmailPressed);
    on<AuthenticateUserDetails>(_authenticateUser);
    on<ResendEmailButtonPressed>(_resendEmailButtonPressed);
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
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError(buttonPressed: state.buttonPressed));
        return;
      }
      add(AuthenticateUserDetails());
    } else {
      print("registration failure");
      return;
    }
  }

  _verifyEmailPressed(
      VerifyEmailPressed event, Emitter<RegisterButtonState> emit) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      emit(NetworkError(buttonPressed: state.buttonPressed));
      return;
    }
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      emit(RegistrationLoading(buttonPressed: state.buttonPressed));
      try {
        await RegisterProfileToFirebase().addDatasToFirebase(event.context);
        emit(RegistrationSuccess(buttonPressed: state.buttonPressed));
        print("success");
      } catch (e) {
        emit(RegisrationFailure(e.toString(),
            buttonPressed: state.buttonPressed));
        print("error $e");
      }
    }
  }

  _authenticateUser(
      AuthenticateUserDetails event, Emitter<RegisterButtonState> emit) async {
    try {
      emit(RegistrationLoading(buttonPressed: state.buttonPressed));
      FirebaseAuthServices _auth = FirebaseAuthServices();
      User? user = await _auth.signUpWithEmailAndPassword();
      if (user != null) {
        FirebaseAuth _authentication = FirebaseAuth.instance;
        _authentication.currentUser!.sendEmailVerification();
        emit(NavigateToOtpPage(buttonPressed: state.buttonPressed));
      } else {
        emit(RegisrationFailure("email already registered",
            buttonPressed: state.buttonPressed));
      }
    } catch (e) {
      emit(RegisrationFailure("something went wrong",
          buttonPressed: state.buttonPressed));
    }
  }

  _resendEmailButtonPressed(
      ResendEmailButtonPressed event, Emitter<RegisterButtonState> emit) {
    try {
      FirebaseAuth _authentication = FirebaseAuth.instance;
      _authentication.currentUser!.sendEmailVerification();
    } catch (e) {
      emit(RegisrationFailure("some thing went wrong",
          buttonPressed: state.buttonPressed));
    }
  }
}
