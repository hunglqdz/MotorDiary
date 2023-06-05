import 'package:flutter/material.dart';
import 'package:motor_diary/setup/setup1.dart';

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
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            const SizedBox(height: 50),
            const Text(
              'Manage your private vehicles :3',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Setup1()));
                    },
                    child: const Text(
                      'SET UP',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ))),
          ],
        ),
      ),
    );
  }
}
