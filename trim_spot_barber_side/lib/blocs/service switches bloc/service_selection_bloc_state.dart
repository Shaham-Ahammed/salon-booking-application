part of 'service_selection_bloc_bloc.dart';

@immutable
sealed class RegisterFormState {}

final class RegisterFormInitial extends RegisterFormState {
  final Map<String, bool> switches;
  List<String> holidays=[];
  RegisterFormInitial({required this.switches,required this.holidays});
  
}
