import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/onboard/onboarding1.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
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
