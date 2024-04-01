part of 'service_selection_bloc_bloc.dart';

@immutable
sealed class RegisterFormEvent {}

class ServiceSwitchPressed extends RegisterFormEvent {
  final String service;

  ServiceSwitchPressed({required this.service});
}

class HolidaysSelected extends RegisterFormEvent {
  final String day;

  HolidaysSelected({required this.day});

}
