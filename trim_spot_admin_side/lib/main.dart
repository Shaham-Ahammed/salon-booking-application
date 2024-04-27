import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_admin_side/firebase_options.dart';
import 'package:trim_spot_admin_side/screens/home.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
       ),
      home: const HomeScreen(),
    );
  }
}
