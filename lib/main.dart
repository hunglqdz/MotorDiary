import 'package:flutter/material.dart';
import 'onboard/onboard.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
