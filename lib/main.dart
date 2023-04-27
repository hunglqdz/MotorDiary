import 'package:flutter/material.dart';
import 'package:motor_diary/onboard/onboarding1.dart';

import 'screens/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const OnBoarding1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
