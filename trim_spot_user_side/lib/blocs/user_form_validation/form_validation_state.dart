part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationState {}

final class FormValidationInitial extends FormValidationState {}

final class NavigateToOtpPage extends FormValidationState {
 final String verificationId;

  NavigateToOtpPage({required this.verificationId});
}

final class AddingToDataToFirebase extends FormValidationState {}

final class NetworkError extends FormValidationState {}

final class DataAddingError extends FormValidationState {}

final class UserNameExists extends FormValidationState {}

final class NavigateToHomePage extends FormValidationState{}

final class PhoneNumberAlreadyRegistered extends FormValidationState{}

final class SomethingWentWrongWithOtpValidation extends FormValidationState{}