import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

import '../constant.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    loadModel();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras![0],
      ResolutionPreset.medium,
    );
    await controller?.initialize();
  }

  Future<void> loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: 'assets/model/detect.tflite',
        labels: 'assets/model/labelmap.txt',
      );
      print('Model loaded: $res');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<void> takePhoto() async {
    try {
      final XFile? file =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        setState(() {
          imageFile = file;
        });
        runObjectDetection(imageFile!.path);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>?> runObjectDetection(String imagePath) async {
    try {
      var recognitions =
          await Tflite.detectObjectOnImage(path: imagePath, model: 'detect');
      return recognitions;
    } catch (e) {
      print('Failed to run object detection: $e');
      return [];
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Camera'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: cameraPreviewWidget(),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: takePhoto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: const Text('TAKE PHOTO'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cameraPreviewWidget() {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }
}
