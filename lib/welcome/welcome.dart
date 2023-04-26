import 'package:flutter/material.dart';

import '../screens/bottom_bar.dart';

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
            const SizedBox(height: 15),
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
            const SizedBox(height: 10),
            const Text(
              'Manage your private vehicles',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}
