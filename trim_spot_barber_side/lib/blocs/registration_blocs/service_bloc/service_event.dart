part of 'service_bloc.dart';

@immutable
sealed class ServiceBlocEvent {}

class ServiceSwitchPressed extends ServiceBlocEvent {
  final String service;

  ServiceSwitchPressed({required this.service});
}

