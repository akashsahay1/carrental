import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Shared Preferences',
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
