import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial(address: "")) {
    on<LocationPickerPressed>(_locationPickerPressed);
    on<TappedOnLocation>(_tappedOnLocation);
    on<PickedShopPosition>(_pickedShopLocation);
  }
  _locationPickerPressed(
      LocationPickerPressed event, Emitter<LocationState> emit) async {
    final checkPermission = await Permission.location.request();
    if (checkPermission.isGranted) {
      emit(NavigateToMap());
      emit(LoadingCurrentLocation());

      Location location = Location();
      try {
        final current = await location.getLocation();

        emit(FetchedCurrentLocation(
            pickerLocation: LatLng(current.latitude!, current.longitude!)));
      } catch (e) {}
    }
  }

  _tappedOnLocation(TappedOnLocation event, Emitter<LocationState> emit) {
    emit(FetchedCurrentLocation(
        pickerLocation:
            LatLng(event.newPosition.latitude, event.newPosition.longitude)));
  }

  _pickedShopLocation(PickedShopPosition event, Emitter<LocationState> emit) {
    String addressPosition = "${event.position}".toString();
    emit(LocationInitial(address: addressPosition));
  }
}
