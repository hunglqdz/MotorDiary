import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/bottom_bar.dart';
import 'package:motor_diary/constant.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
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
        //     colors: [
        //       primaryColor,
        //       Colors.white,
        //       primaryColor,
        //     ],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        color: primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.motorcycle, size: 200),
              const SizedBox(height: 150),
              myTextField(
                'Enter Username',
                Icons.person,
                false,
                nameController,
              ),
              const SizedBox(height: 20),
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
              myButton(
                context,
                false,
                () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  )
                      .then((value) {
                    print('Created New Account');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomBar(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    print('Error ${error.toString()}');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
