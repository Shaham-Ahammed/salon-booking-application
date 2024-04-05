import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/screens/on_boarding_screen/introduction_page.dart';
import 'blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<OnboardindBloc>(create: (context) => OnboardindBloc()),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
     BlocProvider(create: (context)=>HolidayBloc()),
      BlocProvider<ServiceBloc>(create: (context) => ServiceBloc())
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: introductionColor)),
      home: FirstIntroductionPage(),
    );
  }
}
