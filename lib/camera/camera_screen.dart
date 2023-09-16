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
  File? imageFile;

  String modelPath = 'assets/models/yolov4-416-fp16.tflite';
  String labelsPath = 'assets/models/labelmap.txt';

  void loadModel() async {
    await Tflite.loadModel(
      model: modelPath,
      labels: labelsPath,
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  void runObjectDetection() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
    var recognitions = await Tflite.detectObjectOnImage(
      path: imageFile!
          .path, // replace with the path to the image you want to detect objects in
      model: modelPath,
      threshold: 0.4, // adjust the threshold as needed
      imageMean: 127.5,
      imageStd: 127.5,
      numResultsPerClass: 1,
    );

    // Process the recognition results
    print(recognitions);

    // Remember to call Tflite.close() when you're done using the model
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Camera Screen"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            runObjectDetection();
                          },
                          child: const Text("PICK FROM GALLERY"),
                        ),
                        Container(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            runObjectDetection();
                          },
                          child: const Text("PICK FROM CAMERA"),
                        )
                      ],
                    ),
                  )
                : Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  )));
  }

  // /// Get from gallery
  // _getFromGallery() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  //   Model model = await PyTorchMobile.loadModel('assets/models/best.pt');
  //   String prediction = await model.getImagePrediction(
  //       imageFile!, 416, 416, 'assets/models/labelmap.txt');
  //   print(prediction);
  // }
  //
  // /// Get from Camera
  // _getFromCamera() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  //   Model model = await PyTorchMobile.loadModel('assets/models/best.pt');
  //   String prediction = await model.getImagePrediction(
  //       imageFile!, 416, 416, 'assets/models/labelmap.txt');
  //   print(prediction);
  // }
}
