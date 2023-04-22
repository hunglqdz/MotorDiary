import 'package:flutter/material.dart';

import 'onboard/onboarding1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Motor Diary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const OnBoarding1());
  }
}
