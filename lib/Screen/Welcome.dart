import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: const Center(
        child: const Text(
          'Welcome to the app!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
