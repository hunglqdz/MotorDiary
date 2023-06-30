import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller!.initialize();
  }

  Future<XFile?> _captureImage() async {
    try {
      await _initializeControllerFuture;

      if (!_controller!.value.isInitialized) {
        throw 'Error: Camera is not initialized.';
      }

      XFile image = await _controller!.takePicture();
      return image;
    } catch (e) {
      print('Error capturing image: $e');
      return null;
    }
  }

  void processImage(String imagePath) async {
    try {
      var output = await Tflite.loadModel(
        model: 'assets/model/detect.tflite',
        labels: 'assets/model/labelmap.txt',
      );
      if (output == 'success') {
        var imageBytes = File(imagePath).readAsBytesSync();
        var result = await Tflite.runModelOnBinary(
          binary: imageBytes,
          numResults: 1,
        );
        if (result != null && result.isNotEmpty) {
          var number = result[0]['label'];
          print('Output number: $number');
        }
      }
    } catch (e) {
      print('Error processing image with Tflite: $e');
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Awesome Camera')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          XFile? image = await _captureImage();
          if (image != null) {
            // Process the captured image with TFLite model
            processImage(image.path);
          }
        },
        child: const Icon(CupertinoIcons.camera),
      ),
    );
  }
}
