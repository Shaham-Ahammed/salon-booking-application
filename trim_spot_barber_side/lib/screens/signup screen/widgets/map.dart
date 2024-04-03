import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
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
  late GoogleMapController mapController;
  LocationData? currentLocation;
  LatLng? pickerLocation;

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    if (await Permission.location.request().isGranted) {
      _getUserLocation();
    }
  }

  _getUserLocation() async {
    Location location = Location();
    try {
      final current = await location.getLocation();
      setState(() {
        currentLocation = current;
        pickerLocation = LatLng(current.latitude!, current.longitude!);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                zoom: 15,
              ),
              onCameraMove: (position) {
                setState(() {
                  pickerLocation = position.target;
                });
              },
              markers: {
                Marker(
                    position: pickerLocation!,
                    markerId: MarkerId("location picker"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueYellow))
              }),
          Positioned(
              bottom: mediaqueryHeight(0.07, context),
              left: mediaqueryWidth(0.28, context),
              child: Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(90),
                child: InkWell(
                  borderRadius: BorderRadius.circular(90),
                  onTap: () {
                    setState(() {
                      add = pickerLocation!.latitude;
                    });
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
