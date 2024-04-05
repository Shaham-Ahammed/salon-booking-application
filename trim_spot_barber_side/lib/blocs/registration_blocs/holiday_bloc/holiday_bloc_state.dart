part of 'holiday_bloc_bloc.dart';

@immutable
sealed class HolidayBlocState {}

final class HolidayBlocInitial extends HolidayBlocState {
 final List<String> holidays ;
  HolidayBlocInitial({required this.holidays});
}
