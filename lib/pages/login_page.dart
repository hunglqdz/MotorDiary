import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/bottom_bar.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/pages/signup_page.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        height: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [primaryColor, Colors.white, primaryColor],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     stops: const [0.25, 0.5, 0.75],
        //   ),
        // ),
        color: primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // illustrationWidget('assets/images/illustration.jpg'),
              const Icon(Icons.motorcycle, size: 200),
              const SizedBox(height: 150),
              myTextField(
                'Enter Email Address',
                Icons.email,
                false,
                emailController,
              ),
              const SizedBox(height: 20),
              myTextField(
                'Enter Password',
                Icons.lock,
                true,
                passwordController,
              ),
              const SizedBox(height: 20),
              myButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                )
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomBar()));
                }).onError((error, stackTrace) {
                  print('Error ${error.toString()}');
                });
              }),
              signUpOption(),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: const Text(
            ' Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
