import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
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

      loc.Location location = loc.Location();
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

  _pickedShopLocation(
      PickedShopPosition event, Emitter<LocationState> emit) async {
    try {
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
              event.position.latitude, event.position.longitude);
     
        geocoding.Placemark place = placemarks.first;        
        String addressPosition =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
        emit(LocationInitial(address: addressPosition));
     
    } catch (e) {
      print("Error fetching placemarks: $e");
    }
 
  }
}
