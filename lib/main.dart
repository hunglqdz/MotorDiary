import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/api/firebase_api.dart';
import 'package:motor_diary/camera/camera_screen.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/notification_screen.dart';

import 'firebase_options.dart';

List<CameraDescription>? cameras;
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
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
        fontFamily: 'Montserrat',
      ),
      navigatorKey: navigatorKey,
      routes: {
        'notification_screen': (context) => const NotificationScreen(),
      },
      home: const CameraScreen(),
    );
  }
}
