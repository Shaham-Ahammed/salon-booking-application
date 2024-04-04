import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_bloc/registration_bloc.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';
import 'package:trim_spot_barber_side/reusable_widgets/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/reusable_widgets/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/screens/signup%20screen/widgets/map.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    super.key,
  });

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        if (state is FetchedCurrentLocation) {
          Navigator.of(context)
              .push(NoTransitionPageRoute(child: GoogleMapScreen()));
        }
      },
      builder: (context, state) {
        
        return Material(
          borderRadius: BorderRadius.circular(8),
          color: greyColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              context.read<RegisterFormBloc>().add(LocationPickerPressed());
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              height: mediaqueryHeight(0.06, context),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaqueryWidth(0.045, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myFont(add == null ? "Shop Location" : add.toString(),
                        fontFamily: balooChettan,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontColor: Colors.black54),
                    Icon(
                      Icons.location_pin,
                      color: Colors.red.shade800,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
