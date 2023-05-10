import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/main.dart';
import 'package:motor_diary/onboard/onboarding2.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_bar.dart';
import 'onboard_content.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  void onSubmit1(context) {
    Provider.of<MyTextFieldValue>(context, listen: false)
        .setText(myController1.text);
  }

  void onSubmit2(context) {
    Provider.of<MyTextFieldValue>(context, listen: false)
        .setText(myController2.text);
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
            const OnboardContent(
                image: 'assets/illustration.jpg',
                title: 'Step 1/3',
                description: "Enter your name and your vehicle's name"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: myController1,
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
                controller: myController2,
                maxLength: 30,
                decoration: const InputDecoration(
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
                          onSubmit1(context);
                          onSubmit2(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const OnBoarding2();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.green),
                        child: const Icon(CupertinoIcons.arrow_right),
                      )),
                ),
              ],
            )
          ]),
        ));
  }
}
