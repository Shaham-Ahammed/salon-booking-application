import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_selection_bloc_event.dart';
part 'service_selection_bloc_state.dart';

class ServiceSwitchBloc extends Bloc<ServiceSwitchEvent, ServiceSwitchState> {
  ServiceSwitchBloc()
      : super(ServiceSwitchInitial(switches: const {
          "haircut": false,
          "facial": false,
          "shave": false,
          "beard trim": false,
          "massage": false,
          "straighten": false
        })) {
     on<ServiceSwitchPressed>(_onServiceSwitchPressed);
  }
   void _onServiceSwitchPressed(
      ServiceSwitchPressed event, Emitter<ServiceSwitchState> emit) {
    final updatedSwitches = Map<String, bool>.from((state as ServiceSwitchInitial).switches);
    updatedSwitches[event.service] = !updatedSwitches[event.service]!;
    emit(ServiceSwitchInitial(switches: updatedSwitches));
 }
}
