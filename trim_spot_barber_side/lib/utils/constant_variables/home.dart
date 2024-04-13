import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';

final PageController homePageController = PageController();

final duration = Duration(seconds: 5);

int currentPage(context) {
  return BlocProvider.of<HomeScreenPageControllerBloc>(context, listen: false)
      .state
      .currentPage;
}


final List<String> timeSlots = [
  '9:00',
  '9:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00',
  '20:30',
];

List<String> booked = ['12:00', '18:00', '20:30'];

final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
