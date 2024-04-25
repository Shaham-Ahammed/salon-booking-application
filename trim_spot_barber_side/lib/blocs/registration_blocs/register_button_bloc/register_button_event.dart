part of 'register_button_bloc.dart';

@immutable
sealed class RegisterButtonEvent {}

final class RegisterButtonPressed extends RegisterButtonEvent {
  final BuildContext context;

  RegisterButtonPressed({required this.context});
}

final class VerifyEmailPressed extends RegisterButtonEvent {
  final BuildContext context;

  VerifyEmailPressed({required this.context});
}

final class AuthenticateUserDetails extends RegisterButtonEvent {}

final class ResendEmailButtonPressed extends RegisterButtonEvent{}