// ignore_for_file: must_be_immutable

part of 'service_bloc.dart';


@immutable
sealed class ServiceBlocState {}

final class ServiceBlocInitial extends ServiceBlocState {
  final Map<String, bool> switches;

  
  ServiceBlocInitial({required this.switches});
}

