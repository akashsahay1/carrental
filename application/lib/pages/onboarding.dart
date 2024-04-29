import 'package:carrental/pages/login.dart';
import 'package:carrental/pages/signup.dart';
import 'package:flutter/material.dart';
import '../preferences_manager.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  void completeOnboarding() async {
    await PreferencesManager.setFirstTime(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        controllerColor: const Color.fromARGB(255, 121, 48, 255),
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Sign Up',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Color.fromARGB(255, 121, 48, 255),
        ),
        onFinish: () {
          completeOnboarding();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Signup(),
            ),
          );
        },
        skipTextButton: Container(
          width: 50.0,
          height: 24.0,
          padding: const EdgeInsets.only(top: 3.0, left: 12.0, right: 12.0, bottom: 3.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 121, 48, 255),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Text(
            'Skip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        trailing: Container(
          width: 50.0,
          height: 24.0,
          padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 121, 48, 255),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextButton(
            onPressed: () {
              completeOnboarding();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                ),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        background: const [
          Text(''),
          Text(''),
          Text(''),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80.0),
                Image.asset('assets/images/onboarding_slide_1.png'),
                const SizedBox(height: 30.0),
                const Text(
                  'Find Cars',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 121, 48, 255)),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Get started by finding cars near your location.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80.0),
                Image.asset('assets/images/onboarding_slide_2.png'),
                const SizedBox(height: 30.0),
                const Text(
                  'Share Confirmation Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 121, 48, 255),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Once you got the car just share the confirmation code with driver to start your journey.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80.0),
                Image.asset('assets/images/onboarding_slide_3.png'),
                const SizedBox(height: 30.0),
                const Text(
                  'Get Going',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 121, 48, 255),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Enjoy your ride and close the ride at your destination.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
