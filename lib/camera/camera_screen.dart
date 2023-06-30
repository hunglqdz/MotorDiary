import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  Future<File>? imageFile;
  File? _image;
  String result = '';
  ImagePicker? imagePicker;

  capturePhoto() async {
    XFile? pickedFile =
        await imagePicker!.pickImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
    });
  }

  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
      model: 'assets/model/detect.tflite',
      labels: 'assets/model/labelmap.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
