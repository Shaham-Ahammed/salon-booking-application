part of 'register_button_bloc.dart';

@immutable
sealed class RegisterButtonState {
  final bool buttonPressed;

  RegisterButtonState({required this.buttonPressed});
}

final class RegisterButtonInitial extends RegisterButtonState {
  RegisterButtonInitial({required super.buttonPressed});
}

final class RegisterationSuccess extends RegisterButtonState {
  RegisterationSuccess({required super.buttonPressed});
}
