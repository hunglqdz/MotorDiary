import 'package:flutter/material.dart';
import 'package:motor_diary/camera/top_image_viewer.dart';

import 'camera_viewer.dart';
import 'capture_button.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        CameraViewer(),
        CaptureButton(),
        TopImageViewer(),
      ],
    );
  }
}
