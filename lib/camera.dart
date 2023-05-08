import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void navigateToNextPage() {
    if (_image != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BottomBar()));
    }
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (_image != null) Image.file(_image!),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: getImage,
              child: const Text('Take Picture'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: navigateToNextPage,
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final File image;

  const NextPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(image),
            const SizedBox(height: 16.0),
            const Text('You can now do whatever you want with the image.'),
          ],
        ),
      ),
    );
  }
}
