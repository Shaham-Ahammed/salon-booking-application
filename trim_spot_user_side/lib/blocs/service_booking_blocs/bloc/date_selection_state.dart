part of 'date_selection_bloc.dart';

@immutable
sealed class DateSelectionState {
  final DateTime? date;
  final String formattedDate;

  DateSelectionState({required this.date, required this.formattedDate});
}

final class DateSelectionInitial extends DateSelectionState {
  DateSelectionInitial({required super.date, required super.formattedDate});
}
