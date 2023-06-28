import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/route_manager.dart';
import 'onboard/onboarding_screen.dart';

int? initScreen;
List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);
  print('initScreen $initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
      routes: {
        '/': (context) => const BottomBar(),
        'first': (context) => const OnboardingScreen(),
      },
    );
  }
}
