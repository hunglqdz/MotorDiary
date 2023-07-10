import 'package:flutter/material.dart';
import 'package:motor_diary/user.dart';

class UserInfoPage extends StatelessWidget {
  final User user;
  const UserInfoPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Vehicle: ${user.vehicle}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
