import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

import 'blocs/on boarding bloc/onboardind_bloc_bloc.dart';
import 'screens/introduction_page.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<OnboardindBloc>(create: (context) => OnboardindBloc())
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
