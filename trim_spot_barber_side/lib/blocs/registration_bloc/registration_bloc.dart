import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

part 'registration_bloc_event.dart';
part 'registration_bloc_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc()
      : super(RegisterFormInitial(switches: const {
          "haircut": false,
          "facial": false,
          "shave": false,
          "beard trim": false,
          "massage": false,
          "straighten": false
        }, holidays: [])) {
    on<ServiceSwitchPressed>(_serviceSwitchPressed);
    on<HolidaysSelected>(_holidaySelected);
    on<LocationPickerPressed>(_locationPickerPressed);
    on<TappedOnLocation>(_tappedOnLocation);
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

  _locationPickerPressed(
      LocationPickerPressed event, Emitter<RegisterFormState> emit) async {
    final checkPermission = await Permission.location.request();
    if (checkPermission.isGranted) {
       emit(FetchedCurrentLocation());
      emit(LoadingCurrentLocation());
      Location location = Location();
      try {
        final current = await location.getLocation();
       
        emit(OpenMap(
            pickerLocation: LatLng(current.latitude!, current.longitude!)));
        emit(RegisterFormInitial(
            switches: (state as RegisterFormInitial).switches,
            holidays: (state as RegisterFormInitial).holidays));
      } catch (e) {}
    }
  }

  _tappedOnLocation(TappedOnLocation event, Emitter<RegisterFormState> emit) {
    emit(OpenMap(
        pickerLocation:
            LatLng(event.newPosition.latitude, event.newPosition.longitude)));
    emit(RegisterFormInitial(
        switches: (state as RegisterFormInitial).switches,
        holidays: (state as RegisterFormInitial).holidays));
  }
}
