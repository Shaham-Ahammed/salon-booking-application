part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {
 final String address ;
  LocationInitial({required this.address});
}

final class PermissionGranted extends LocationState {}

final class LoadingCurrentLocation extends LocationState {}

final class FetchedCurrentLocation extends LocationState {
 final LatLng pickerLocation;
  FetchedCurrentLocation({required this.pickerLocation});
}

final class NavigateToMap extends LocationState{}

final class SelectedShopLocation extends LocationState{}