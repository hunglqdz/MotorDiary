import 'package:flutter/material.dart';
import 'onboard/onboarding.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
