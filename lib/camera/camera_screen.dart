import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _capturePhoto() async {
    if (!_controller.value.isInitialized) {
      return;
    }
    final image = await _controller.takePicture();
    // Call the method to process the captured image
    processImage(image.path);
  }

  void processImage(String imagePath) async {
    // Load the TFLite model
    await Tflite.loadModel(
      model: 'assets/model/yolov4-416-fp16.tflite',
      labels: 'assets/model/labelmap.txt',
    );

    // Run object detection on the image
    final recognition = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 10,
      threshold: 0.4,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    // Process the recognition results
    print(recognition);

    // Dispose the TFLite model
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller),
          ),
        ),
        ElevatedButton(
          onPressed: _capturePhoto,
          child: const Text('Capture photo'),
        ),
      ],
    );
  }
}
