part of 'registration_bloc.dart';

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

class LocationPickerPressed extends RegisterFormEvent{}

final class TappedOnLocation extends RegisterFormEvent {
 final LatLng newPosition;
  TappedOnLocation({required this.newPosition});
}