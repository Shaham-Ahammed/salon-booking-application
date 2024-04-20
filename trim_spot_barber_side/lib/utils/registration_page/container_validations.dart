import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';

bool locationValidation(context) {
  return BlocProvider.of<LocationBloc>(context, listen: false)
      .state
      .address
      .isNotEmpty;
}

bool shopImageValidation(context) {
  return BlocProvider.of<ImageBloc>(context, listen: false)
      .state
      .ShopImageImagePath
      .isNotEmpty;
}

bool profileValidation(context) {
  return BlocProvider.of<ImageBloc>(context, listen: false)
      .state
      .ProfileImagePath
      .isNotEmpty;
}

bool licenseValidation(context) {
  return BlocProvider.of<ImageBloc>(context, listen: false)
      .state
      .LicensemagePath
      .isNotEmpty;
}

bool openingTimeValidation(context) {
  return BlocProvider.of<WorkingHoursBloc>(context, listen: false)
      .state
      .openTimeDisplayText
      .isNotEmpty;
}

bool closingTimeValidation(context) {
  return BlocProvider.of<WorkingHoursBloc>(context, listen: false)
      .state
      .closingTimeDisplayText
      .isNotEmpty;
}

bool registerbuttonPressed(context) {
  return BlocProvider.of<RegisterButtonBloc>(context, listen: true)
      .state
      .buttonPressed;
}
