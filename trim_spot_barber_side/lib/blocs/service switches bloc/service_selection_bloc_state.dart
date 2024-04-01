part of 'service_selection_bloc_bloc.dart';

@immutable
sealed class ServiceSwitchState {}

final class ServiceSwitchInitial extends ServiceSwitchState {
  final Map<String, bool> switches;

  ServiceSwitchInitial({required this.switches});
  
}
