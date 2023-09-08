import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../insert.dart';
import '../update.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // List<CameraDescription>? cameras;
  // CameraController? controller;
  // XFile? imageFile;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initializeCamera();
  //   loadModel();
  // }
  //
  // Future<void> initializeCamera() async {
  //   cameras = await availableCameras();
  //   controller = CameraController(
  //     cameras![0],
  //     ResolutionPreset.medium,
  //   );
  //   await controller?.initialize();
  // }
  //
  // Future<void> loadModel() async {
  //   try {
  //     String? res = await Tflite.loadModel(
  //       model: 'assets/model/detect.tflite',
  //       labels: 'assets/model/labelmap.txt',
  //     );
  //     print('Model loaded: $res');
  //   } catch (e) {
  //     print('Failed to load model: $e');
  //   }
  // }
  //
  // Future<void> takePhoto() async {
  //   try {
  //     final XFile? file =
  //         await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (file != null) {
  //       setState(() {
  //         imageFile = file;
  //       });
  //       runObjectDetection(imageFile!.path);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future<List<dynamic>?> runObjectDetection(String imagePath) async {
  //   try {
  //     var recognitions =
  //         await Tflite.detectObjectOnImage(path: imagePath, model: 'detect');
  //     return recognitions;
  //   } catch (e) {
  //     print('Failed to run object detection: $e');
  //     return [];
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   controller?.dispose();
  //   Tflite.close();
  //   super.dispose();
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Awesome Camera'),
  //     ),
  //     body: Column(
  //       children: [
  //         Expanded(
  //           child: Container(
  //             child: cameraPreviewWidget(),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: SizedBox(
  //             height: 60,
  //             width: 150,
  //             child: ElevatedButton(
  //               onPressed: takePhoto,
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: primaryColor,
  //               ),
  //               child: const Text('TAKE PHOTO'),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget cameraPreviewWidget() {
  //   if (controller == null || !controller!.value.isInitialized) {
  //     return Container();
  //   }
  //   return AspectRatio(
  //     aspectRatio: controller!.value.aspectRatio,
  //     child: CameraPreview(controller!),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('events');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ccreate(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Events',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: FirebaseAnimatedList(
        query: db_Ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          Map Event = snapshot.value as Map;
          Event['key'] = snapshot.key;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateRecord(
                    Event_Key: Event['key'],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.indigo[100],
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[900],
                  ),
                  onPressed: () {
                    db_Ref.child(Event['key']).remove();
                  },
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    Event['url'],
                  ),
                ),
                title: Text(
                  Event['name'],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  Event['number'],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
