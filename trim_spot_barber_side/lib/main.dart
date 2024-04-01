import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/reusable%20widgets/colors.dart';
import 'blocs/service switches bloc/service_selection_bloc_bloc.dart';
import 'blocs/on boarding bloc/onboardind_bloc_bloc.dart';
import 'screens/on boarding screen/introduction_page.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<OnboardindBloc>(create: (context) => OnboardindBloc()),
      BlocProvider<RegisterFormBloc>(
        create: (context) => RegisterFormBloc(),
      )
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
