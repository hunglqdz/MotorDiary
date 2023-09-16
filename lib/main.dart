import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/firebase_options.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';
import 'package:motor_diary/widgets/constant.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        primaryColor: primaryColor,
        primarySwatch: Colors.teal,
        fontFamily: 'Montserrat',
      ),
      home: const BottomBar(),
    );
  }
}
