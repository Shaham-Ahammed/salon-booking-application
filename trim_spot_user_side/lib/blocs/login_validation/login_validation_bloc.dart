import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/repository/login_validation.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/login_screen/formkey.dart';
part 'login_validation_event.dart';
part 'login_validation_state.dart';

class LoginValidationBloc
    extends Bloc<LoginValidationEvent, LoginValidationState> {
  LoginValidationBloc() : super(LoginValidationInitial()) {
    on<LoginButtonPressed>(_loginButtonPressed);
  }
  _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginValidationState> emit) async {
    if (loginFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      final connection = await Connectivity().checkConnectivity();

      if (connection.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }
      emit(AuthenticatingUser());
      final querySnapshot = await LoginValidationRepository().gettingUserName();
      if (querySnapshot.docs.isEmpty) {
        emit(UserDoesNotExist());
   
        return;
      } else {
        final data = querySnapshot.docs.first;
        final password = data['password'];
        if (password == loginPasswordController.text.trim()) {
          emit(LoginSuccess());
      
          return;
        } else {
          emit(InocrrectPassword());
          
          return;
        }
      }
    } else {
      return;
    }
  }
}
