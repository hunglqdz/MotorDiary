import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/constants/routes.dart';
import 'package:motor_diary/pages/events/create_update_event_page.dart';
import 'package:motor_diary/pages/login_page.dart';
import 'package:motor_diary/pages/register_page.dart';
import 'package:motor_diary/pages/timeline_page.dart';
import 'package:motor_diary/welcome_screen.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
      ),
      home: const WelcomeScreen(),
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        mainRoute: (context) => const BottomBar(),
        timelineRoute: (context) => const TimelinePage(),
        createOrUpdateEventRoute: (context) => const CreateUpdateEventPage(),
      },
    ),
  );
}
