import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bloc_observer.dart';
import 'package:trim_spot_user_side/blocs/google_sign_in_blox/google_sign_in_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/firebase_options.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'screens/introduction_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GoogleSignInBloc>(
          create: (context) => GoogleSignInBloc()),
      BlocProvider<LoginValidationBloc>(
          create: (context) => LoginValidationBloc()),
      BlocProvider<FormValidationBloc>(
          create: (context) => FormValidationBloc()),
      BlocProvider<ProfileImageBloc>(create: (context) => ProfileImageBloc()),
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
              const BottomSheetThemeData(backgroundColor: introductionColor)),
      home: FirstIntroductionPage(),
    );
  }
}
