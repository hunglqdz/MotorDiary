import 'package:flutter/material.dart';
import 'package:motor_diary/onboard/onboarding2.dart';

import '../screens/bottom_bar.dart';
import 'onboard_content.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Setup'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: [
            const OnboardContent(
                image: 'assets/illustration.jpg',
                title: 'Step 1/3',
                description: "Enter your name and your vehicle's name"),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLength: 30,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLength: 30,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.motorcycle),
                  border: OutlineInputBorder(),
                  labelText: "Your Vehicle's Name",
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      height: 60,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text('SKIP'),
                      )),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OnBoarding2()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.green),
                        child: const Icon(Icons.arrow_forward),
                      )),
                ),
              ],
            )
          ]),
        ));
  }
}
