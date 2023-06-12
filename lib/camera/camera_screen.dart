import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'display_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Get the list of available cameras.
    availableCameras().then((cameras) {
      // Select the first camera from the list.
      final camera = cameras.first;

      // Create a CameraController instance.
      _controller = CameraController(camera, ResolutionPreset.high);

      // Initialize the controller.
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Display the camera preview.
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          // Display the take photo button.
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () async {
                // Take the photo.
                final image = await _controller.takePicture();

                // Display the photo.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DisplayImageScreen(imagePath: image.path),
                  ),
                );
              },
              child: const Text('Take Photo'),
            ),
          ),
        ],
      ),
    );
  }
}
