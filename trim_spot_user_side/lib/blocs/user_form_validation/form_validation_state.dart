part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationState {}

final class FormValidationInitial extends FormValidationState {}

final class NavigateToOtpPage extends FormValidationState{}

final class AddingToDataToFirebase extends FormValidationState{}

final class NetworkError extends FormValidationState{}

final class DataAddingError extends FormValidationState{}

