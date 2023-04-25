import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool isCameraInitialized = false;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    final CameraController cameraController = CameraController(
        cameraDescription, ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg);
    await previousCameraController?.dispose();
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }
    if (mounted) {
      setState(() {
        isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    onNewCameraSelected(cameras[0]);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController!.value.isTakingPicture) {
      return null;
    }
    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occurred while taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () async {
        XFile? rawImage = await takePicture();
        File imageFile = File(rawImage!.path);
        int currentUnix = DateTime.now().millisecondsSinceEpoch;
        final directory = await getApplicationDocumentsDirectory();
        String fileFormat = imageFile.path.split('.').last;
        await imageFile.copy('${directory.path}/$currentUnix.$fileFormat');
      },
      child: Stack(
        alignment: Alignment.center,
        children: const [Icon(Icons.camera, color: Colors.white, size: 80)],
      ),
    ));
  }
}
