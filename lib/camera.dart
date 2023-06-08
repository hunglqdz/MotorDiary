import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/bottom_bar.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:tflite/tflite.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;

  late Interpreter _interpreter;
  // String _result = '';

  Future<void> _getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    // final List? recognitions = await Tflite.runModelOnImage(
    //   path: image.path,
    //   numResults: 1,
    //   threshold: 0.5,
    //   imageMean: 127.5,
    //   imageStd: 127.5,
    // );

    setState(() {
      _image = File(image.path);
      // _result = recognitions![0]['label'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      final interpreterOptions = InterpreterOptions();
      _interpreter = await Interpreter.fromAsset('assets/detect.tflite',
          options: interpreterOptions);
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  List<int> runInference(List<Image> input) {
    final inputs = [input];
    final outputs = [_interpreter.getOutputTensor(0).shape];
    _interpreter.run(inputs, outputs);
    return outputs[0];
  }

  @override
  void dispose() {
    _interpreter.close();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Tflite.loadModel(
  //     model: 'assets/detect.tflite',
  //     labels: 'assets/labelmap.txt',
  //   );
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   Tflite.close();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null) ...[
              Image.file(_image!),
              const SizedBox(height: 20),
              const Text(
                'I am Iron Man',
                // 'Result: $_result',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ] else ...[
              const Text(
                'Take a picture',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: 60,
              height: 60,
              child: ElevatedButton(
                onPressed: _getImage,
                child: const Icon(Icons.camera_alt),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.green),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('is_setup_complete', true);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BottomBar()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'DONE',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const Text('Model inference result:'),
            FutureBuilder<List<int>>(
              future: runInference([Image.file(_image!)]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final output = snapshot.data;
                  return Text('$output');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
