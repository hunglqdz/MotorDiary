import 'package:flutter/material.dart';
import 'package:motor_diary/onboard/onboarding1.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/illustration.jpg')),
            const SizedBox(height: 50),
            const Text(
              'Motor Diary',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            const SizedBox(height: 50),
            const Text(
              'Manage your private vehicles',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            const Spacer(),
            Row(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OnBoarding1()));
                        },
                        child: const Text(
                          'SET UP',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ))),
                const Spacer(),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomBar()));
                        },
                        child: const Text(
                          'SKIP',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
