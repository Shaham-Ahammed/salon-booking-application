import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_selection_bloc_event.dart';
part 'service_selection_bloc_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc()
      : super(RegisterFormInitial(switches: const {
          "haircut": false,
          "facial": false,
          "shave": false,
          "beard trim": false,
          "massage": false,
          "straighten": false
        },holidays: [])) {
    on<ServiceSwitchPressed>(_serviceSwitchPressed);
    on<HolidaysSelected>(_holidaySelected);
  }
  void _serviceSwitchPressed(
      ServiceSwitchPressed event, Emitter<RegisterFormState> emit) {
    final updatedSwitches =
        Map<String, bool>.from((state as RegisterFormInitial).switches);
    updatedSwitches[event.service] = !updatedSwitches[event.service]!;
    emit(RegisterFormInitial(
        switches: updatedSwitches,
        holidays: (state as RegisterFormInitial).holidays));
  }

  void _holidaySelected(
      HolidaysSelected event, Emitter<RegisterFormState> emit) {
    final currentState = state;

    if (currentState is RegisterFormInitial) {
      currentState.holidays.contains(event.day)
          ? currentState.holidays.remove(event.day)
          : currentState.holidays.add(event.day);
      emit(RegisterFormInitial(
          switches: currentState.switches, holidays: currentState.holidays));
    }
  }
}
