import 'package:flutter/material.dart';
import 'package:medjam/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'modules/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
