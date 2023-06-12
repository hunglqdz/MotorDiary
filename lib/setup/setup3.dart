import 'package:flutter/material.dart';
import 'package:motor_diary/camera/camera_screen.dart';
import 'setup_content.dart';

class Setup3 extends StatefulWidget {
  const Setup3({super.key});

  @override
  State<Setup3> createState() => _Setup3State();
}

class _Setup3State extends State<Setup3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SET UP'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(children: [
          const SetupContent(
              image: 'assets/illustration.jpg',
              title: 'Step 3/3',
              description: "Take your first odometer"),
          const Spacer(),
          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/odometer.png')),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const CameraScreen()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('TAKE PHOTO'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
