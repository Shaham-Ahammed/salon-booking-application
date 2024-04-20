part of 'register_button_bloc.dart';

@immutable
sealed class RegisterButtonEvent {}

final class RegisterButtonPressed extends RegisterButtonEvent {
  final BuildContext context;

  RegisterButtonPressed({required this.context});
}
