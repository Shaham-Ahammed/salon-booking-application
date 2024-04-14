part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationEvent {}

final class SubmitButtonPressed extends FormValidationEvent {
  final BuildContext context;
  SubmitButtonPressed(this.context);
}
