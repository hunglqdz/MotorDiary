import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;

  @override
  void initState() {
    super.initState();

    loadModel();
  }

  void loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model/detect.tflite',
      labels: 'assets/model/labelmap.txt',
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
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
            if (_image != null)
              Image.file(_image!)
            else
              const Text('No image selected.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Take Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
