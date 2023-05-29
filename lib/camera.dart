import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  String _result = '';

  Future<void> _getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _image = File(image.path);
      _result = recognitions![0]['label'];
    });
  }

  @override
  void initState() {
    super.initState();
    Tflite.loadModel(
      model: 'assets/detect.tflite',
      labels: 'assets/labelmap.txt',
    );
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) ...[
              Image.file(_image!),
              const SizedBox(height: 20),
              Text(
                'Result: $_result',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ] else ...[
              const Text(
                'Take a picture',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Take Picture',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
