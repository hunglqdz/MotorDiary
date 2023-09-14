import 'package:flutter/material.dart';
import 'package:motor_diary/auth.dart';
import 'package:motor_diary/pages/login_signup_page.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomBar();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
