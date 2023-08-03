import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

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
    String? res = await Tflite.loadModel(
      model: 'assets/model/detect.tflite',
      labels: 'assets/model/labelmap.txt',
    );
    print(res);
  }

  Future<void> takePhoto() async {
    try {
      final XFile? file =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        setState(() {
          imageFile = file;
        });
        runModelOnImage(imageFile!.path);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> runModelOnImage(String imagePath) async {
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: imagePath,
      );
      print(recognitions);
    } catch (e) {
      print(e);
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
          ElevatedButton(
            onPressed: takePhoto,
            child: const Text('Take Photo'),
          ),
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
