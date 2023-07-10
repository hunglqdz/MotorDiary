import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/setup/setup2.dart';
import '../user.dart';
import 'setup_content.dart';

class Setup1 extends StatefulWidget {
  const Setup1({super.key});

  @override
  State<Setup1> createState() => _Setup1State();
}

class _Setup1State extends State<Setup1> {
  final _nameController = TextEditingController();
  final _vehicleController = TextEditingController();
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final file = File('user.json');
      final json = await file.readAsString();
      final user = User.fromJson(jsonDecode(json));
      setState(() {
        _user = user;
      });
    } catch (e) {
      print('Failed to load user: $e');
    }
  }

  Future<void> _saveUser() async {
    try {
      final file = File('user.json');
      final json = jsonEncode(_user!.toJson());
      await file.writeAsString(json);
    } catch (e) {
      print('Failed to save user: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _vehicleController.dispose();
    super.dispose();
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
              controller: _nameController,
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
              controller: _vehicleController,
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
                    final name = _nameController.text;
                    final vehicle = _vehicleController.text;
                    setState(() {
                      _user = User(name, vehicle);
                    });
                    _saveUser();
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
