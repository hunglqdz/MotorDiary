import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motor_diary/api/firebase_api.dart';
import 'package:motor_diary/firebase_options.dart';
import 'package:motor_diary/welcome_screen.dart';
import 'package:motor_diary/widgets/constant.dart';

List<CameraDescription> cameras = [];
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

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
      home: const WelcomeScreen(),
      routes: {WelcomeScreen.route: (context) => const WelcomeScreen()},
    );
  }
}
