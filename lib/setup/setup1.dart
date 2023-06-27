import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/setup/setup2.dart';
import 'setup_content.dart';

class Setup1 extends StatefulWidget {
  const Setup1({super.key});

  @override
  State<Setup1> createState() => _Setup1State();
}

class _Setup1State extends State<Setup1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SET UP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            const SetupContent(
                image: 'assets/images/illustration.jpg',
                title: 'Step 1/3',
                description: "Enter your name and your vehicle's name"),
            const Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                maxLength: 30,
                decoration: InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Setup2()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: primaryColor),
                    child: const Icon(CupertinoIcons.arrow_right),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
