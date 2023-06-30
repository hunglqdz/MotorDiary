import 'package:flutter/material.dart';
import 'package:motor_diary/camera/camera_screen.dart';
import 'package:motor_diary/constant.dart';
import 'setup_content.dart';
import 'package:camera/camera.dart';

class Setup3 extends StatefulWidget {
  const Setup3({super.key});

  @override
  State<Setup3> createState() => _Setup3State();
}

class _Setup3State extends State<Setup3> {
  List<CameraDescription>? cameras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SET UP'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const SetupContent(
              image: 'assets/images/illustration.jpg',
              title: 'Step 3/3',
              description: "Take your first odometer"),
          const Spacer(),
          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/odometer.png')),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const CameraScreen()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: const Text('TAKE PHOTO'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
