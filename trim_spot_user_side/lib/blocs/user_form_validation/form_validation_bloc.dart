// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:trim_spot_user_side/data/repository/user_registration.dart';
import 'package:trim_spot_user_side/utils/firebase/collection_references.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/register_page/formkey.dart';
import 'package:trim_spot_user_side/utils/register_page/valuenotifier.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc() : super(FormValidationInitial()) {
    on<SubmitButtonPressed>(_submitButtonPressed);
  }
  _submitButtonPressed(
    SubmitButtonPressed event,
    Emitter<FormValidationState> emit,
  ) async {
    pressedSubmitButton.value = true;
    pressedSubmitButton.notifyListeners();
    if (registerFormKey.currentState!.validate() &&
        BlocProvider.of<ProfileImageBloc>(event.context).state.imageInBytes !=
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
      try {
         User? user = await FirebaseAuthService().signUpWithEmailAndPassword();
        if (user == null) {
          emit(DataAddingError());
          return;
        }
        AddUserDetailsToFirebase().addImage(event.context);

        String downloadURL =
            await userStorageReference(event.context).getDownloadURL();

        AddUserDetailsToFirebase().addData(downloadURL);
       
        emit(NavigateToOtpPage());
      } catch (e) {
        emit(DataAddingError());
        return null;
      }
    } else {
      return;
    }
  }
}
