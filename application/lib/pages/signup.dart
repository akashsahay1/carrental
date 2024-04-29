import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Color(0xffEA4335),
                      size: 45.0,
                    ),
                    onPressed: () {
                      print("Pressed");
                    },
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xff0866FF),
                      size: 45.0,
                    ),
                    onPressed: () {
                      print("Pressed");
                    },
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.apple,
                      color: Color(0xff666666),
                      size: 45.0,
                    ),
                    onPressed: () {
                      print("Pressed");
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Or',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Sign up with email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _fullnameController,
                        decoration: const InputDecoration(
                          hintText: 'Full name',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Mobile',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: _cpasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By creating an account I agree to terms and policies.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color(0xff7540EE)),
                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text('Create account'),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 16.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xff7540EE),
                              fontSize: 16.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
