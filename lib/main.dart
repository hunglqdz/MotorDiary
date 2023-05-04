import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(primarySwatch: Colors.green),
      home: BottomBar(cameras),
      debugShowCheckedModeBanner: false,
    );
  }
}
