import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/setup/setup2.dart';
import 'package:motor_diary/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setup_content.dart';

class Setup1 extends StatefulWidget {
  const Setup1({super.key});

  @override
  State<Setup1> createState() => _Setup1State();
}

class _Setup1State extends State<Setup1> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _vehicle = TextEditingController();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('userdata'));

    User user = User.fromJson(jsondatais);

    if (jsondatais.isNotEmpty) {
      _name.value = TextEditingValue(text: user.name);
      _vehicle.value = TextEditingValue(text: user.vehicle);
    }
  }

  void storeData() {
    User user = User(_name.text, _vehicle.text);

    String userdata = jsonEncode(user);
    print(userdata);

    sharedPreferences.setString('userdata', userdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SET UP'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const SetupContent(
              image: 'assets/images/illustration.jpg',
              title: 'Step 1/3',
              description: "Enter your name and your vehicle's name"),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _name,
              maxLength: 30,
              decoration: const InputDecoration(
                suffixIcon: Icon(CupertinoIcons.person),
                border: OutlineInputBorder(),
                labelText: 'Your Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _vehicle,
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
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {
                    print(_name.text);
                    print(_vehicle.text);
                    storeData();
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
    );
  }
}
