import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motor_diary/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboard/onboard.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: isViewed != 0 ? const OnBoard() : const BottomBar(),
    );
  }
}
