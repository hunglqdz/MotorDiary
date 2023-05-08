import 'package:flutter/material.dart';
import 'welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
