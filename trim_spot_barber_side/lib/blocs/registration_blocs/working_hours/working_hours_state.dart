part of 'working_hours_bloc.dart';

@immutable
sealed class WorkingHoursState {}

final class WorkingHoursInitial extends WorkingHoursState {
  final DateTime? openingTime;
  final DateTime? closingTime;
  final String openTimeDisplayText;
  final String closingTimeDisplayText;
  WorkingHoursInitial(
      {required this.openingTime,
      required this.closingTime,
    required  this.closingTimeDisplayText ,
     required this.openTimeDisplayText });
}
