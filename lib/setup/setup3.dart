import 'package:flutter/material.dart';
import 'package:motor_diary/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottom_bar.dart';
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CameraScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text('TAKE PHOTO'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 60,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('is_setup_complete', true);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomBar()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text('DONE'),
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
