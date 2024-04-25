import 'package:flutter/material.dart';
import 'preferences_manager.dart';

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
      ),
      home: PreferencesManager.isFirstTime() ? const OnboardingScreen() : const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Shared Preferences',
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              'Save Car as Toyota Corolla',
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                print('Toyota Corrolla');
              },
              child: const Text('Save Car'),
            )
          ],
        ),
      ),
    );
  }
}

class _OnboardingScreen extends State<OnboardingScreen> {
  void completeOnboarding() async {
    await PreferencesManager.setFirstTime(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Onboarding Screen',
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              'Save Car as Toyota Corolla',
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                completeOnboarding();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: const Text('Finish Onboarding'),
            )
          ],
        ),
      ),
    );
  }
}
