import 'package:flutter/material.dart';
import 'package:kijana/Screen/Home.dart';
import 'package:kijana/Screen/SignIn.dart';
import 'package:kijana/Screen/SignUp.dart';
import 'package:kijana/Screen/Password.dart';
// import 'package:kijana/Screen/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kijana/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized before Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initialize Firebase with platform-specific options
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/welcome': (context) =>  HomePage(),
      },
    );
  }
}
