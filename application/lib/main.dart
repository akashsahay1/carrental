import 'package:carrental/pages/signup.dart';
import 'package:flutter/material.dart';
import 'preferences_manager.dart';
//import './pages/home.dart';
import './pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.initializePreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 238, 0)),
        useMaterial3: true,
        fontFamily: 'KoHo',
      ),
      home: PreferencesManager.isFirstTime() ? const OnboardingScreen() : const Signup(),
    );
  }
}
