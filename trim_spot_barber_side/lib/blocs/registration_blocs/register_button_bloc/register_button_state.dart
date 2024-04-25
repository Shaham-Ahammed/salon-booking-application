part of 'register_button_bloc.dart';

@immutable
sealed class RegisterButtonState {
  final bool buttonPressed;

  RegisterButtonState({required this.buttonPressed});
}

final class RegisterButtonInitial extends RegisterButtonState {
  RegisterButtonInitial({required super.buttonPressed});
}

final class NavigateToOtpPage extends RegisterButtonState {
  NavigateToOtpPage({required super.buttonPressed});
}

final class RegistrationSuccess extends RegisterButtonState {
  RegistrationSuccess({required super.buttonPressed});
}

final class RegisrationFailure extends RegisterButtonState {
  final String error;
  RegisrationFailure(this.error, {required super.buttonPressed});
}

final class RegistrationLoading extends RegisterButtonState {
  RegistrationLoading({required super.buttonPressed});
}

final class NetworkError extends RegisterButtonState{
  NetworkError({required super.buttonPressed});
}
