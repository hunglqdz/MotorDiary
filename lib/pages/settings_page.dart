import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/pages/login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Log out'),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print('Signed Out');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LogInPage()));
            });
          },
        ),
      ),
    );
  }
}
