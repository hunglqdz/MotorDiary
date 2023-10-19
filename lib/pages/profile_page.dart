import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Username: ${user!.displayName}',
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(),
                const Text(
                  'Vehicle configuration',
                  style: TextStyle(fontSize: 24),
                ),
                TextField(
                  controller: controller1,
                  decoration: const InputDecoration(
                      labelText: 'Time to change oil',
                      hintText: 'How many days?',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(CupertinoIcons.drop)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller2,
                  decoration: const InputDecoration(
                      labelText: 'Distance to change oil',
                      hintText: 'How many kms?',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(CupertinoIcons.drop)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller3,
                  decoration: const InputDecoration(
                      labelText: 'Time to maintain',
                      hintText: 'How many days?',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(CupertinoIcons.hammer)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller4,
                  decoration: const InputDecoration(
                      labelText: 'Distance to maintain',
                      hintText: 'How many kms?',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(CupertinoIcons.hammer)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller5,
                  decoration: const InputDecoration(
                      labelText: 'Time to refuel',
                      hintText: 'How many days?',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(CupertinoIcons.repeat)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller6,
                  decoration: const InputDecoration(
                      labelText: 'Distance to refuel',
                      hintText: 'How many kms?',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(CupertinoIcons.repeat)),
                  keyboardType: TextInputType.number,
                ),
              ],
            )),
      ),
    );
  }
}
