part of 'login_validation_bloc.dart';

@immutable
sealed class LoginValidationState {}

final class LoginValidationInitial extends LoginValidationState {}

final class LoginSuccess extends LoginValidationState {}

final class AuthenticatingUser extends LoginValidationState {}

final class UserDoesNotExist extends LoginValidationState {}

final class InocrrectPassword extends LoginValidationState {}

final class NetworkError extends LoginValidationState {}
