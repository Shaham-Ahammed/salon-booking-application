part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionState {
  final String currentLocation;
 final Position? currentPosition;
  LocationPermissionState({required this.currentLocation,required this.currentPosition});
}

final class LocationPermissionInitial extends LocationPermissionState {
  LocationPermissionInitial({required super.currentLocation, required super.currentPosition});
  
}

final class LocationServiceNotEnabled extends LocationPermissionState {
  LocationServiceNotEnabled({required super.currentLocation, required super.currentPosition});
 
}
