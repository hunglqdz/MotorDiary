import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/auth_page.dart';

import 'firebase_options.dart';

// int? initScreen;
List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // initScreen = prefs.getInt('initScreen');
  // await prefs.setInt('initScreen', 1);
  // print('initScreen $initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Montserrat',
      ),
      // initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
      // routes: {
      //   '/': (context) => const BottomBar(),
      //   'first': (context) => const AuthPage(),
      //   '/display': (context) => const SettingsPage(),
      // },
      home: const AuthPage(),
    );
  }
}
