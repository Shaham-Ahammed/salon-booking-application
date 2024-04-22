// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/data/repository/user_registration.dart';
import 'package:trim_spot_user_side/screens/otp_verification.dart';
import 'package:trim_spot_user_side/utils/firebase/collection_references.dart';
import 'package:trim_spot_user_side/utils/otp_page/form_key.dart';
import 'package:trim_spot_user_side/utils/otp_page/otp_controller.dart';

import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/register_page/formkey.dart';
import 'package:trim_spot_user_side/utils/register_page/valuenotifier.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc() : super(FormValidationInitial()) {
    on<SubmitButtonPressed>(_submitButtonPressed);
    on<OtpValidation>(_otpValidation);
    on<SubmitOtpButtonPressed>(_submitOtpButtonPressed);
  }
  _submitButtonPressed(
    SubmitButtonPressed event,
    Emitter<FormValidationState> emit,
  ) async {
    pressedSubmitButton.value = true;
    pressedSubmitButton.notifyListeners();
    if (registerFormKey.currentState!.validate() &&
        BlocProvider.of<ProfileImageBloc>(event.context, listen: false)
                .state
                .imageInBytes !=
            null) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }

      emit(AddingToDataToFirebase());
      final collection =
          await FirebaseFirestore.instance.collection("user_information").get();

      final List<String> usernames = [];
      usernames.clear();
      for (var doc in collection.docs) {
        usernames.add(doc.data()['username'] as String);
      }

      if (usernames.contains(registerUsernameController.text.trim())) {
        emit(UserNameExists());
        return;
      }
      add(OtpValidation(context: event.context));

      // try {
      //   User? user = await FirebaseAuthService().signUpWithEmailAndPassword();
      //   if (user == null) {
      //     emit(DataAddingError());
      //     print("authentication error");
      //     return;
      //   }

      // } catch (e) {
      //   emit(DataAddingError());
      //   print("firebasekk add error $e");
      //   return null;
      // }
    } else {
      return;
    }
  }

  _otpValidation(OtpValidation event, Emitter<FormValidationState> emit) async {
    final String phoneNumber = "+91${registerPhoneController.text.toString()}";
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {},
          codeSent: (String otpCode, int? resendToken) {
            Navigator.of(event.context).push(FadeTransitionPageRoute(
                child: OtpVerificationScreen(verificationId: otpCode)));
          },
          codeAutoRetrievalTimeout: (String verificationid) {},
          phoneNumber: phoneNumber);
    } catch (e) {
      emit(PhoneNumberAlreadyRegistered());
    }
  }

  _submitOtpButtonPressed(
      SubmitOtpButtonPressed event, Emitter<FormValidationState> emit) async {
    if (registerOtpFormKey.currentState!.validate()) {
      emit(AddingToDataToFirebase());
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId,
            smsCode: registerOtpController.text.toString());
        await AddUserDetailsToFirebase().addImage(event.context);

        String downloadURL =
            await userStorageReference(event.context).getDownloadURL();

        await AddUserDetailsToFirebase().addData(downloadURL);

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .whenComplete(() {
          emit(NavigateToHomePage());
        });
      } catch (e) {
        emit(SomethingWentWrongWithOtpValidation());
        print("endhoo error und $e");
      }
    } else {
      return;
    }
  }
}
