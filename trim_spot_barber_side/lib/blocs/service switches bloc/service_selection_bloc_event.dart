part of 'service_selection_bloc_bloc.dart';

@immutable
sealed class ServiceSwitchEvent {}

class ServiceSwitchPressed extends ServiceSwitchEvent {
  final String service;

  ServiceSwitchPressed({required this.service});
 
}
