import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';

import 'screens/first_presentation_screen/first_introduction_page.dart';

void main(List<String> args) {
  runApp(App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
    theme: ThemeData(bottomSheetTheme:BottomSheetThemeData(backgroundColor: introductionColor) ),
     home: FirstIntroductionPage(),
    );
  }
}
