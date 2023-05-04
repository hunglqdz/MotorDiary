import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  List<CameraDescription> cameras;
  CameraPage(this.cameras, {super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  String imagePath = '';

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.high);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
                width: 200,
                height: 200,
                child: AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: CameraPreview(controller!))),
            TextButton(
                onPressed: () async {
                  try {
                    final image = await controller!.takePicture();
                    setState(() {
                      imagePath = image.path;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Take Photo')),
          ],
        ),
      )),
    );
  }
}
