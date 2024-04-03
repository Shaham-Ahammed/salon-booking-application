// ignore_for_file: must_be_immutable

part of 'registration_bloc.dart';

@immutable
sealed class RegisterFormState {}

final class RegisterFormInitial extends RegisterFormState {
  final Map<String, bool> switches;
  List<String> holidays = [];
  String address = "";
  RegisterFormInitial({required this.switches, required this.holidays});
}

final class Openmap extends RegisterFormState{}