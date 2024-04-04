import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trim_spot_barber_side/blocs/registration_bloc/registration_bloc.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';

double? add;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<RegisterFormBloc, RegisterFormState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is LoadingCurrentLocation) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is OpenMap) {
                return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: state.pickerLocation,
                      zoom: 15,
                    ),
                    onTap: (position) {
                      context
                          .read<RegisterFormBloc>()
                          .add(TappedOnLocation(newPosition: position));
                    },
                    markers: {
                      Marker(
                          position: state.pickerLocation,
                          markerId: MarkerId("location picker"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueYellow))
                    });
              }
              return Container();
            },
          ),
          Positioned(
              bottom: mediaqueryHeight(0.07, context),
              left: mediaqueryWidth(0.28, context),
              child: Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(90),
                child: InkWell(
                  borderRadius: BorderRadius.circular(90),
                  onTap: () {
                    // setState(() {
                    //   add = pickerLocation!.latitude;
                    // });
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: cyanColor, width: 4),
                      // color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(90),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5), // color of the shadow
                          spreadRadius: 4, // spread radius
                          blurRadius: 5, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: mediaqueryWidth(0.1, context),
                          vertical: mediaqueryHeight(0.006, context)),
                      child: myFont("Drop Here 📍",
                          fontFamily: belleza,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontColor: Colors.white),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
