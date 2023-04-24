import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'screens/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    home: CameraPage(camera: firstCamera),
    debugShowCheckedModeBanner: false,
  ));
}
