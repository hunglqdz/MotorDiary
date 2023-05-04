import 'package:flutter/material.dart';
import 'package:motor_diary/main.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';

import 'onboard_content.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(children: [
          const OnboardContent(
              image: 'assets/illustration.jpg',
              title: 'Step 3/3',
              description: "Take your first odometer"),
          const Spacer(),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/odometer.png')),
          const Spacer(),
          ElevatedButton(
            child: const Text('Click here'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BottomBar(cameras)));
            },
          )
        ]),
      ),
    );
  }
}
