import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/main.dart';
import 'package:motor_diary/setup/setup2.dart';
import 'package:provider/provider.dart';
import 'setup_content.dart';

class Setup1 extends StatefulWidget {
  const Setup1({super.key});

  @override
  State<Setup1> createState() => _Setup1State();
}

class _Setup1State extends State<Setup1> {
  final nameController = TextEditingController();
  final vehicleController = TextEditingController();

  void onSubmit1(context) {
    Provider.of<MyTextFieldValue>(context, listen: false)
        .setText(nameController.text);
  }

  void onSubmit2(context) {
    Provider.of<MyTextFieldValue>(context, listen: false)
        .setText(vehicleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('SET UP'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: [
            const SetupContent(
                image: 'assets/illustration.jpg',
                title: 'Step 1/3',
                description: "Enter your name and your vehicle's name"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                maxLength: 30,
                decoration: const InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: vehicleController,
                maxLength: 30,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.motorcycle),
                  border: OutlineInputBorder(),
                  labelText: "Your Vehicle's Name",
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      onSubmit1(context);
                      onSubmit2(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Setup2();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.green),
                    child: const Icon(CupertinoIcons.arrow_right),
                  )),
            ),
          ]),
        ));
  }
}
